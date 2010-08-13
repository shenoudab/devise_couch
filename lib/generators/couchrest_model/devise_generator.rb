require 'generators/devise/orm_helpers'

module CouchrestModel
  module Generators
    class DeviseGenerator < Rails::Generators::NamedBase
      include Devise::Generators::OrmHelpers

      def generate_model
        invoke "couchrest_model:model", [name] unless model_exists?
      end

      def inject_devise_content
        inject_into_file model_path, model_contents, :after => "CouchRest::Model::Base\n"
      end
    end
  end
end