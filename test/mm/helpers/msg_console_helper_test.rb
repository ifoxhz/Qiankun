require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

describe "Qiankun::Mm::MsgConsoleHelper" do
  setup do
    helpers = Class.new
    helpers.extend Qiankun::Mm::MsgConsoleHelper
    [helpers.foo]
  end

  asserts("#foo"){ topic.first }.nil
end
