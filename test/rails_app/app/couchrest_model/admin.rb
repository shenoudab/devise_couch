require 'shared_admin'

class Admin < CouchRest::Model::Base
  include SharedAdmin
  include Shim

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :timeoutable and :oauthable
  #devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable

  use_database CouchRest.database!("http://admin:admin@127.0.0.1:5984/devise_couch")
  
  property :username
  timestamps!

  view_by :username
end
