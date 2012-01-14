require 'spec_helper'

include Bottles

describe "Bottle Manager" do
  before do
    BottleManager.bottles_dir = "/tmp/bottles"
    @bottle_manager = BottleManager.instance
    @bottle_manager.bootstrap if not File.directory?(BottleManager.bottles_dir)
  end

  after do
    FileUtils.rm_rf "/tmp/bottles"
  end

  it "initializes properly" do
    File.directory?(BottleManager.bottles_dir).should be_true
  end

  it "should bootstrap properly" do
    File.directory?(BottleManager.bottles_dir).should be_true
  end
  
  it "should create the bottle dir" do
    lambda { @bottle_manager.new_bottle("Foobottle", "http://myfoobottle.com") }.should_not raise_error
    File.directory?(BottleManager.bottles_dir + "/foobottle").should be_true
  end

  it "should rise an error trying to create the same bottle" do
    @bottle_manager.new_bottle("Foobottle", "http://myfoobottle.com") 
    lambda { @bottle_manager.new_bottle("Foobottle", "http://myfoobottle.com") }.should raise_error(ArgumentError,"Bottle name already taken.")
  end

  it "should return a BottleConfig when creating" do
    @bottle_manager.new_bottle("Foobottle", "http://myfoobottle.com").should be_a_kind_of(BottleConfig)
  end
  
  it "should find an existing bottle" do
    @bottle_manager.new_bottle("Foobottle", "http://myfoobottle.com")
    @bottle_manager.find_bottle("Foobottle").should_not be_nil
  end

  it "should load an existing bottle" do
    @bottle_manager.new_bottle("Foobottle", "http://myfoobottle.com")
    @bottle_manager.load_bottle("Foobottle").should_not be_nil
    @bottle_manager.load_bottle("Foobottle").should be_a_kind_of(BottleConfig)
  end

end
