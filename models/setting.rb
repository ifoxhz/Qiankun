require 'settingslogic'
require 'yaml'
YAML::ENGINE.yamler= 'syck'

class Settings < Settingslogic
  file=File.expand_path("../../config/application.yml",__FILE__)
	#puts file
  source file
  #source "#{Padrino.root}/config/app_config.yml"
  namespace "development"
end