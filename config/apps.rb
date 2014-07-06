##
# This file mounts each app in the Padrino project to a specified sub-uri.
# You can mount additional applications using any of these commands below:
#
#   Padrino.mount('blog').to('/blog')
#   Padrino.mount('blog', :app_class => 'BlogApp').to('/blog')
#   Padrino.mount('blog', :app_file =>  'path/to/blog/app.rb').to('/blog')
#
# You can also map apps to a specified host:
#
#   Padrino.mount('Admin').host('admin.example.org')
#   Padrino.mount('WebSite').host(/.*\.?example.org/)
#   Padrino.mount('Foo').to('/foo').host('bar.example.org')
#
# Note 1: Mounted apps (by default) should be placed into the project root at '/app_name'.
# Note 2: If you use the host matching remember to respect the order of the rules.
#
# By default, this file mounts the primary app which was generated with this project.
# However, the mounted app can be modified as needed:
#
#   Padrino.mount('AppName', :app_file => 'path/to/file', :app_class => 'BlogApp').to('/')
#

##
# Setup global project settings for your apps. These settings are inherited by every subapp. You can
# override these settings in the subapps as needed.
#
Padrino.configure_apps do
  enable :sessions
  set :session_secret, 'a18a87d70514e73081e297f38e1f3802f13f4c898c0c31a79423cbf9bb34ed2b'
  set :protection, :except => :path_traversal
  set :protect_from_csrf, true

  #it did not work , not applied to sub app
  #set :css_asset_folder, 'stylesheets'
  #set :js_asset_folder, 'javascripts'
end

# Mounts the core application for this project

Padrino.mount("Qiankun::Admin", :app_file => Padrino.root('admin/app.rb')).to("/admin")
Padrino.mount('Qiankun::Um', :app_file => Padrino.root('um/app.rb')).to('/um')


Padrino.mount('Qiankun::Org', :app_file => Padrino.root('org/app.rb')).to('/org')

Padrino.mount('Qiankun::Mm', :app_file => Padrino.root('mm/app.rb')).to('/mm')

Padrino.mount('Qiankun::Am', :app_file => Padrino.root('am/app.rb')).to('/am')
Padrino.mount('Qiankun::App', :app_file => Padrino.root('app/app.rb')).to('/')
