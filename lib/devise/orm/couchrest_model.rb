require 'devise_couch'
require 'devise/orm/couchrest_model/schema'

module Devise
  module Orm
    module CouchrestModel
      module Hook
        def devise_modules_hook!
          extend Schema
          create_authentication_views
          yield
          return unless Devise.apply_schema
          devise_modules.each { |m| send(m) if respond_to?(m, true) }
        end

        private
        def create_authentication_views
          authentication_keys.each do |key_name|
            view_by key_name
          end
          view_by :confirmation_token
          view_by :authentication_token
          view_by :reset_password_token
          view_by :unlock_token
        end
      end
    end
  end
end

module CouchRest
  module Model
    class Base
      extend ::Devise::Models
      extend ::Devise::Orm::CouchrestModel::Hook
    end
  end
end
