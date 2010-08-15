require "couchrest/model/base"

module Devise
  module Orm
    module CouchrestModel
      module Hook
        def devise_modules_hook!
          extend Schema
          #Include Compatibility
          yield
          return unless Devise.apply_schema
          devise_modules.each { |m| send(m) if respond_to?(m, true) }
        end
      end #Hook

      module Schema
        include Devise::Schema
        # Tell how to apply schema methods.
        def apply_devise_schema(name, type, options={})
          return unless Devise.apply_schema
          property name, :type => type
        end
      end #Module Schema
    end #CouchRest
  end #Orm
end #Devise

module CouchRest
  module Model
    class Base
      extend ::Devise::Models
      extend ::Devise::Orm::CouchrestModel::Hook
    end
  end
end
