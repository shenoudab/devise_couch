module Devise
  module Orm
    module CouchrestModel
      module Compatibility
        extend ActiveSupport::Concern
        extend ActiveModel::Naming

        module ClassMethods
          def find(*args)
            options = args.extract_options!
            conditions = options[:conditions]
            case authentication_keys.first
            when :login     then by_login(:key => conditions[authentication_keys.first]).first
            when :username  then by_username(:key => conditions[authentication_keys.first]).first
            when :email     then by_email(:key => conditions[authentication_keys.first]).first
            else                 by_login(:key => conditions[authentication_keys.first]).first
            end
          end
        end
        
        def reload
        end
      end
    end
  end
end
