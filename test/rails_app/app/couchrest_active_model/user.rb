require 'shared_user'
require File.join(File.dirname(__FILE__), '../couchrest_model/shim.rb')

class User < CouchrestModel::Model::Base

  property :username
  property :facebook_token
  timestamps!  

  include SharedUser
  include Shim     
end
