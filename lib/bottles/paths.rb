module Bottles
  class Paths
    def self.data_dir
      File.dirname(__FILE__) + "/../../data/"
    end

    def self.ui_dir
      File.dirname(__FILE__) + "/../../ui/"
    end

    def self.icons_dir
      File.dirname(__FILE__) + "/../../icons/"
    end

    def self.bin_dir
      File.dirname(__FILE__) + "/../../bin/"
    end
  end

end
