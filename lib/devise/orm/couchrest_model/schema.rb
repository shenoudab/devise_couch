module Devise
  module Orm
    module CouchrestModel
      module Schema
        include Devise::Schema
        # Tell how to apply schema methods.
        def apply_devise_schema(name, type, options={})
          return unless Devise.apply_schema
          property name, type, options
        end

        def find_for_authentication(conditions)
          find(:conditions => conditions)
        end

        def find(*args)
          options = args.extract_options!
          raise "You can't search with more than one condition yet =(" if options[:conditions].keys.size > 1
          find_by_key_and_value(options[:conditions].keys.first, options[:conditions].values.first)
        end
        
        private
        
        def find_by_key_and_value(key, value)
          if key == :id
            get(value)
          else
            send("by_#{key}", {:key => value, :limit => 1}).first
          end
        end
      end
    end
  end
end
