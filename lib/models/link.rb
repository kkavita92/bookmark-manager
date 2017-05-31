require 'data_mapper'
require 'dm-postgres-adapter'

DataMapper.setup(:default, 'postgres://localhost/bookmark_manager_test')

class Link
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :address, String

end

DataMapper.finalize
DataMapper.auto_upgrade!
