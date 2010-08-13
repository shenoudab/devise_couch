require 'shared_admin'

class Admin < CouchrestModel::Model::Base

  property :username, :type => String

  timestamps!

  include SharedAdmin
  include Shim
end
