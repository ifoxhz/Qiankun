require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

describe "Qiankun::Am::ActiviesHelper" do
  setup do
    helpers = Class.new
    helpers.extend Qiankun::Am::ActiviesHelper
    [helpers.foo]
  end

  asserts("#foo"){ topic.first }.nil
end
