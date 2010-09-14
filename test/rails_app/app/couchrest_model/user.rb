require 'shared_user'

class User < CouchRest::Model::Base
  use_database CouchRest.new.database('devise_couch')

  property :username
  property :facebook_token
  timestamps!

  include SharedUser
  include Shim
end
