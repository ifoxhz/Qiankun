
module Qiankun
  class Apiapp < Grape::API

    
    class << self

      def cascade
        []
      end

      def root
        @_root ||= File.expand_path('..', __FILE__)
      end

      def dependencies
        @_dependencies ||= Dir[File.expand_path('../*.rb', __FILE__)]
      end

      def load_paths
      	puts "load_path=#{File.expand_path('..', __FILE__)}"
        @_load_paths ||= [ File.expand_path('..', __FILE__) ]
      end

      def setup_application!
        @_configured ||= begin
          Padrino.set_load_paths(*load_paths)
          Padrino.require_dependencies(dependencies, force: true)
          Grape::API.logger = Padrino.logger
          true
        end
      end

      def app_file
        ""
      end

      def public_folder
        ""
      end

      def app_name
      	self.to_s
      end
    end

    setup_application!
    mount Qiankun::Api::Ping
  end
end