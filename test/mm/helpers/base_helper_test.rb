require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

describe "Qiankun::Mm::BaseHelper" do
  setup do
    helpers = Class.new
    helpers.extend Qiankun::Mm::BaseHelper
    [helpers.foo]
  end

  asserts("#foo"){ topic.first }.nil
end
