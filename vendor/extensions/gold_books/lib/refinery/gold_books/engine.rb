module Refinery
  module GoldBooks
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::GoldBooks

      engine_name :refinery_gold_books

      initializer "register refinerycms_gold_books plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "gold_books"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.gold_books_admin_gold_books_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/gold_books/gold_book',
            :title => 'author'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::GoldBooks)
      end
    end
  end
end
