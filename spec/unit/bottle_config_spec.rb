require 'spec_helper'

include Bottles

describe "BottleConfig" do

  before do
    BottleManager.bottles_dir = "/tmp/bottles"
    @bottle_manager = BottleManager.instance
    @bottle_manager.bootstrap if not File.directory?(BottleManager.bottles_dir)
  end
  
  after do
    FileUtils.rm_rf "/tmp/bottles"
  end

  it "should have a valid path" do
    config = @bottle_manager.new_bottle 'foobootle', 'http://url.foo.bar'
    File.exist?(config.path).should be_true
  end

end
