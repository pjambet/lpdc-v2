module Refinery
  module Distributors
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Distributors

      engine_name :refinery_distributors

      initializer "register refinerycms_distributors plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "distributors"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.distributors_admin_distributors_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/distributors/distributor',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Distributors)
      end
    end
  end
end
