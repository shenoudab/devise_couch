require 'shared_admin'
require File.join(File.dirname(__FILE__), '../couchrest_model/shim.rb')

class Admin < CouchrestModel::Model::Base

  property :username, :type => String
  timestamps!

  include SharedAdmin
  include Shim 
  
end
