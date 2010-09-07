require 'couchrest/model/base'
require 'devise/orm/couchrest_model/compatibility'

module Devise
  module Orm
    module CouchrestModel
      module Hook
        def devise_modules_hook!
          extend Schema
          #include Compatibility
          yield
          return unless Devise.apply_schema
          devise_modules.each { |m| send(m) if respond_to?(m, true) }
        end
      end

      module Schema
        include Devise::Schema
        # Tell how to apply schema methods.
        def apply_devise_schema(name, type, options={})
          return unless Devise.apply_schema
          property name, type, options
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
