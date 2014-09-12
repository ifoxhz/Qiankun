# Defines our constants
RACK_ENV = ENV['RACK_ENV'] ||= 'development'  unless defined?(RACK_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

# Load our dependencies
require 'rubygems' unless defined?(Gem)
require 'thin'
require 'bundler/setup'
Bundler.require(:default, RACK_ENV)

##
# ## Enable devel logging
#
# Padrino::Logger::Config[:development][:log_level]  = :devel
# Padrino::Logger::Config[:development][:log_static] = true
#
# ## Configure your I18n
#
# I18n.default_locale = :en
# I18n.enforce_available_locales = false
#
# ## Configure your HTML5 data helpers
#
# Padrino::Helpers::TagHelpers::DATA_ATTRIBUTES.push(:dialog)
# text_field :foo, :dialog => true
# Generates: <input type="text" data-dialog="true" name="foo" />
#
# ## Add helpers to mailer
#
# Mail::Message.class_eval do
#   include Padrino::Helpers::NumberHelpers
#   include Padrino::Helpers::TranslationHelpers
# end

##
# Add your before (RE)load hooks here
#

Padrino.before_load do
Padrino.dependency_paths << Padrino.root('api/*.rb')

#require "activesupport"
I18n.default_locale = 'zh_cn'
Dir.glob(File.expand_path("#{PADRINO_ROOT}/um/locale", __FILE__) + '/**/*.yml').each do |file|
  I18n.load_path << file
end
end

##
# Add your after (RE)load hooks here
#
Padrino.after_load do
#set :login_page, Qiankun::Um.url(:sessions,:new)
#set :admin_model, "User"
end


#[ 'config/initializers' ].each do |path|
#  Dir[File.expand_path("../../#{path}/**/*.rb", __FILE__)].each do |f|
#    require f
#  end
#end

Padrino::Logger::Config[:test] = { log_level: :debug, stream: :to_file}
Padrino::Logger::Config[:development] = { log_level: :devel, stream: :stdout}
Padrino::Logger::Config[:production] = { log_level: :info,  stream: :to_file}

Padrino.load!
