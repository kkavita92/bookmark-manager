class Tag
  include DataMapper::Resource
  #has n, :tags, through: Resource
  property :id, Serial
  property :name, String

end
