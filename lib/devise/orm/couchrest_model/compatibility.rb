module Devise
  module Orm
    module CouchrestModel
      module Compatibility
        extend ActiveSupport::Concern
        extend ActiveModel::Naming

        module ClassMethods
          # Add ActiveRecord like finder
          def find(*args)
            p *args
            # TODO This needs to be altered to support, for example:
            #
            #     find(:first, :conditions => {:email => 'example@example.com'})
            #     find(:first, :conditions => {:confirmation_token=>"kBFXeMHS1FX79NL5UKBe"})
            super
          end
        end
        
        def reload
        end
      end
    end
  end
end
