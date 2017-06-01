require 'data_mapper'
require 'dm-postgres-adapter'

DATABASE = "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}"
DataMapper.setup(:default, ENV['DATABASE_URL'] || DATABASE)

class Tag
  include DataMapper::Resource
  #has n, :tags, through: Resource

  property :id, Serial
  property :name, String

end
