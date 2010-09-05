require 'devise/orm/couchrest_model/compatibility'
require 'devise/orm/couchrest_model/schema'
require 'devise/orm/couchrest_model/date_time'
require 'couchrest/model/validations/uniqueness'

module Devise
  module Orm
    module CouchrestModel
      module Hook
        def devise_modules_hook!
          extend Schema
          include ActiveModel::Validations
          include ActiveModelCompatibility
          include Compatibility
          class << self; attr_reader :descendants; end;

          def self.validates_uniqueness_of(*fields)
            validates_with UniquenessValidator, _merge_attributes(fields)
          end
          
          yield

          return unless Devise.apply_schema
          devise_modules.each { |m| send(m) if respond_to?(m, true) }
        end
      end

      module ActiveModelCompatibility
        # include ActiveModel::Validations does not make save check valid?.
        # This may not be the best solution, but it seems to work. Note that
        # Compatibility is included after this module; its #save method handles
        # the :validate => false option.
        def save(*args)
          retval = valid? && super(*args)
          assert_save_successful(:save, retval)
          retval
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
