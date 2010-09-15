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
            by_login(:key => conditions[authentication_keys.first]).first
          end
        end
        
        def reload
        end
      end
    end
  end
end
