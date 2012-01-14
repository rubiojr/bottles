require 'observer'

module Bottles
  Dir[File.dirname(__FILE__) + "/../../ui/*_ui.rb"].each do |ui|
    require ui
  end

  module UI
    def self.bundled_icons_path
      File.dirname(__FILE__) + "/../../icons/"
    end
  end

  class BottleListDispatcher
    include Observable
    include Singleton

    def add_bottle(name, icon)
      changed
      notify_observers [name,icon]
    end

  end

  class BottleSelectorDialog < Qt::Dialog

    def initialize(parent = nil)
      super(parent)
      BottleListDispatcher.instance.add_observer self 
      @ui = Ui::BottleSelectorDialog.new
      @ui.setup_ui(self)
      @ui.newBottleButton.connect(SIGNAL :clicked) { showCreateBottleDialog }
      BottleManager.instance.all.each do |bc|
        icon = bc.icon || (Bottles::UI.bundled_icons_path + "/bottles.svg")
        BottleListDispatcher.instance.add_bottle(bc.name, icon)
      end
    end

    def update(spec)
      add_bottle spec[0], spec[1]
    end

    def add_bottle(name, icon_file)
      item = Qt::ListWidgetItem.new name, @ui.listWidget
      item.icon = Qt::Icon.new(icon_file)
    end

    def showCreateBottleDialog
      CreateBottleDialog.new.show
    end

  end

  class CreateBottleDialog < Qt::Dialog
    def initialize(parent = nil)
      super(parent)
      @ui = Ui::CreateBottleDialog.new
      @ui.setup_ui(self)
      @ui.chooseIconButton.connect(SIGNAL :clicked) { chooseIcon }
      @ui.buttonBox.connect(SIGNAL :accepted) { createBottle }
      @icon_path = Bottles::UI.bundled_icons_path + 'bottles.svg'
      @ui.chooseIconButton.icon = Qt::Icon.new(@icon_path)
    end

    def chooseIcon
      icon = Qt::FileDialog.getOpenFileName self, "Select Icon", ENV["HOME"], "Image Files (*.png *.jpg *.bmp *.svg)"
      @ui.chooseIconButton.icon = Qt::Icon.new(icon)
      @icon_path = icon
    end

    def createBottle
      name = @ui.nameEntry.text
      url = @ui.urlEntry.text
      if name.strip.chomp.empty? or url.strip.chomp.empty?
      else
        BottleListDispatcher.instance.add_bottle @ui.nameEntry.text, @icon_path
        Bottles::App.createBottle @ui.nameEntry.text, @ui.urlEntry.text, @icon_path
      end
    end

  end
end
