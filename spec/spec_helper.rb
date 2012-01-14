require 'rubygems'
require 'rspec/autorun'
require 'simplecov'

SimpleCov.start do
    add_filter '/spec/'
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'bottles'

module TestHelpersMod
  
  def data_dir 
    File.join(File.dirname(__FILE__),"data")
  end

end
