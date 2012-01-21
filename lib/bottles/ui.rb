require 'observer'
require 'yaml'
require 'bottles/paths'

module Bottles
  Dir[Bottles::Paths.ui_dir + "/*_ui.rb"].each do |ui|
    require ui
  end

  module UI
    def self.bundled_icons_path
      Bottles::Paths.icons_dir
    end

    def self.bundled_templates
      YAML.load_file(Bottles::Paths.data_dir + "/templates.yml")
    end
  end

  class BottleListDispatcher
    include Observable
    include Singleton

    def add_bottle(name, icon)
      changed
      notify_observers [name,icon]
    end

    def remove_bottle(name)
      notify_observers name
    end


  end

  class BottleSelectorDialog < Qt::Dialog

    def initialize(parent = nil)
      super(parent)
      BottleListDispatcher.instance.add_observer self 
      @ui = Ui::BottleSelectorDialog.new
      @ui.setup_ui(self)
      currentRow = 0 
      @ui.newBottleButton.connect(SIGNAL :clicked) { showCreateBottleDialog }
      @ui.deleteButton.connect(SIGNAL :clicked) { delete_selected_bottle }
      @ui.listWidget.connect SIGNAL('itemActivated(QListWidgetItem*)') do |item|
        item_activated item
      end
      connect SIGNAL('accepted()') do 
        ok_pressed
      end
      BottleManager.instance.all.each do |bc|
        icon = bc.icon || (Bottles::UI.bundled_icons_path + "/bottles.svg")
        BottleListDispatcher.instance.add_bottle(bc.name, icon)
      end
    end
    
    def delete_selected_bottle
      name = @ui.listWidget.currentItem.text
      msg_box = Qt::MessageBox.new
      msg_box.icon = Qt::MessageBox::Question
      msg_box.setText("Do you want to delete #{name} bottle?");
      msg_box.setStandardButtons(Qt::MessageBox::Cancel | Qt::MessageBox::Ok);
      msg_box.setDefaultButton(Qt::MessageBox::Cancel)
      ret = msg_box.exec();
      if Qt::MessageBox::Ok == ret
        BottleManager.instance.delete_bottle name  
        @ui.listWidget.takeItem @ui.listWidget.currentRow
      end
    end

    def ok_pressed
      Bottles::App.run_bottle @ui.listWidget.currentItem.text
      exit
    end
    
    def item_activated(item)
      Bottles::App.run_bottle item.text
      exit
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
      @ui.chooseIconButton.text = ""
      @ui.buttonBox.connect(SIGNAL :accepted) { createBottle }
      @icon_path = Bottles::UI.bundled_icons_path + '/bottles.svg'
      @ui.chooseIconButton.icon = Qt::Icon.new(@icon_path)
      @ui.listWidget.connect(SIGNAL :itemSelectionChanged) { template_selected }
      Bottles::UI.bundled_templates.each do |t|
        item = Qt::ListWidgetItem.new t[:name], @ui.listWidget
        item.icon = Qt::Icon.new(Bottles::UI.bundled_icons_path + "/#{t[:icon]}")
      end
    end

    def template_selected
      ci = @ui.listWidget.currentItem
      url = ""
      if ci
        @ui.nameEntry.text = ci.text
        Bottles::UI.bundled_templates.each do |t|
          if t[:name] == ci.text
            @ui.urlEntry.text = t[:url] 
            @icon_path = File.join(Bottles::UI.bundled_icons_path, t[:icon])
          end
        end
        @ui.chooseIconButton.icon = ci.icon
      end
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
        Bottles::App.run_bottle @ui.nameEntry.text
      end
    end

  end
end
