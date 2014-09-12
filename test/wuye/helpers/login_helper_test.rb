require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

describe "Qiankun::Wuye::LoginHelper" do
  setup do
    helpers = Class.new
    helpers.extend Qiankun::Wuye::LoginHelper
    [helpers.foo]
  end

  asserts("#foo"){ topic.first }.nil
end
