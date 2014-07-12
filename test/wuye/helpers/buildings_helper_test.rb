require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

describe "Qiankun::Wuye::BuildingsHelper" do
  setup do
    helpers = Class.new
    helpers.extend Qiankun::Wuye::BuildingsHelper
    [helpers.foo]
  end

  asserts("#foo"){ topic.first }.nil
end
