require 'Qt4'
require 'qtwebkit'
require 'yaml'
require 'singleton'
require 'fileutils'
$: << File.dirname(__FILE__) 
require 'bottles/ui'

module Bottles
  
  VERSION = '0.1'

  class App
    def self.run
      Qt::Application.new(ARGV) do |app|
        bs = BottleSelectorDialog.new
        bs.show
        app.applicationName = "Bottles"
        app.exec
      end
    end

    def self.run_bottle(path)
      if not bottle_running?(path)
        fork do
          exec "#{File.dirname(__FILE__)}/../bin/bottle-runner", path
        end
      end
    end

    def self.bottle_running?(name)
      proc_name = name.strip.chomp.split('/').last + "-bottle"
      !`pgrep -f ^#{proc_name}`.strip.chomp.empty?
    end

    def self.createBottle(name, url, icon = nil)
      config = BottleManager.instance.load_or_create_bottle(name, url, icon)
    end
  end

  class BottleView < Qt::WebView
    
    def initialize(bottle_config, parent = nil)
      super(parent)
      @bottle_manager = BottleManager.instance
      @bottle_config = bottle_config
      connect(SIGNAL('loadProgress(int)')) { |p| load_progress(p) }
      connect(SIGNAL('urlChanged(QUrl)')) { |o| url_changed(o) }
      setGeometry 0,0,900,600
      load_cookies
      load_content
    end

    def url_changed(url)
      save_cookies
    end

    def load_progress(p)
    end

    def load_content
      self.load Qt::Url.new(@bottle_config.url)
    end

    def save_cookies
      puts "saving cookies to #{@bottle_config.cookies_file}"
      access_manager = self.page.networkAccessManager
      cookie_jar = access_manager.cookieJar
      config = {}
      config[:cookies] = []
      cookie_jar.allCookies.each do |c|
        config[:cookies] << c.toRawForm.data
      end
      File.open(@bottle_config.cookies_file, 'w') do |f|
        f.puts YAML.dump(config)
      end
    end

    def load_cookies
      access_manager = self.page.networkAccessManager
      cookie_jar = access_manager.cookieJar
      if File.exist? @bottle_config.cookies_file
        c = YAML.load_file(@bottle_config.cookies_file)
        cookies = []
        c[:cookies].each do |c|
          c1 = Qt::NetworkCookie.parseCookies(Qt::ByteArray.new(c))
          cookies += Qt::NetworkCookie.parseCookies(Qt::ByteArray.new(c))
        end
        cookie_jar.setAllCookies cookies
      end
    end

  end

  class BottleConfig

    attr_reader :path

    def initialize(name, url, path, icon = nil, autosave = true)
      fixed_url = url
      if url !~ /^(http:|https:)/
        fixed_url = "http://#{url}"
      end
      @config = {}
      @config[:name] = name
      @config[:url] = fixed_url 
      @path = path
      save
    end
    
    def icon
      Dir["#{@path}/icon.*"].first
    end

    def url
      @config[:url]
    end
    
    def name
      @config[:name]
    end

    def cookies_file
      @path + "/cookies.yml"
    end

    def save
      File.open(@path + '/config.yml', 'w') do |f|
        f.puts @config.to_yaml
      end
    end

    def self.load(name, path)
      config = YAML.load_file path + "/config.yml"
      BottleConfig.new name, config[:url], path, false
    end

    def self.load_from_file(path)
      config = YAML.load_file path 
      BottleConfig.new config[:name], config[:url], File.dirname(path), false
    end

  end

  class BottleManager
    
    include Singleton

    class << self
      attr_accessor :bottles_dir
    end
    @bottles_dir = ENV['HOME'] + "/.bottles/"

    def initialize
      bootstrap
    end

    def bootstrap
      FileUtils.mkdir_p(BottleManager.bottles_dir) unless File.directory?(BottleManager.bottles_dir)
    end
    
    def load_bottle(name)
      target_dir = File.join(BottleManager.bottles_dir, name.gsub(/\s/, '_').downcase)
      raise ArgumentError.new("Bottle does not exist.") if not File.directory?(target_dir)
      BottleConfig.load(name, target_dir)
    end

    def load_or_create_bottle(name, url, icon)
      if find_bottle(name)
        load_bottle(name)
      else
        new_bottle(name, url, icon)
      end
    end

    def new_bottle(name, url, icon = nil)
      formatted_name = name.gsub(/\s/, '_').downcase

      if icon and !File.exist?(icon)
        raise ArgumentError.new("Invalid icon file #{icon}.")
      end

      target_dir = File.join(BottleManager.bottles_dir, name.gsub(/\s/, '_').downcase)
      raise ArgumentError.new("Bottle name already taken.") if File.directory?(target_dir)
      FileUtils.mkdir target_dir

      # Copy icon to bottle directory
      icon_dest = nil
      if icon
        icon_ext = File.extname(icon)
        icon_dest = target_dir + "/icon#{icon_ext}"
        FileUtils.cp icon, icon_dest
      end

      # Create .desktop file
      desktop_spec = "[Desktop Entry]\n"
      desktop_spec += "Name=#{name}\n"
      desktop_spec += "GenericName=#{name}\n"
      desktop_spec += "Exec=bottle-runner #{target_dir}\n"
      desktop_spec += "StartupNotify=true\n"
      desktop_spec += "Terminal=false\n"
      desktop_spec += "Type=Application\n"
      desktop_spec += "Icon=#{icon_dest}\n"
      desktop_spec += "Categories=Web;Internet;GNOME;\n"
      File.open(ENV["HOME"] + "/.local/share/applications/#{formatted_name}-bottle.desktop", 'w') do |f|
        f.puts desktop_spec
      end
      BottleConfig.new(name,url,target_dir)
    end

    def find_bottle(name)
      target_dir = File.join(BottleManager.bottles_dir, name.gsub(/\s/, '_').downcase)
      if File.exist?(target_dir + "/config.yml")
        load_bottle(name)
      else
        nil
      end
    end

    def all
      configs = []
      Dir["#{BottleManager.bottles_dir}/*"].each do |bd|
        next if bd =~ /\.backup$/
        if File.exist?(bd + "/config.yml")
          configs << BottleConfig.load_from_file( bd + "/config.yml" )
        end
      end
      configs
    end

  end

end
