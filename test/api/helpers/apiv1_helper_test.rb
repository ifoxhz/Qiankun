require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

describe "Qiankun::Api::Apiv1Helper" do
  setup do
    helpers = Class.new
    helpers.extend Qiankun::Api::Apiv1Helper
    [helpers.foo]
  end

  asserts("#foo"){ topic.first }.nil
end
