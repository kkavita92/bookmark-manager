require 'data_mapper'
require 'dm-postgres-adapter'

DATABASE = "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}"

DataMapper.setup(:default, ENV['DATABASE_URL'] || DATABASE)

class Link
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :address, String

end

DataMapper.finalize
DataMapper.auto_upgrade!
