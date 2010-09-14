require 'shared_admin'

class Admin < CouchRest::Model::Base
  use_database CouchRest.new.database('devise_couch')

  property :username, :type => String

  timestamps!

  include SharedAdmin
  include Shim
end
