###### Post Model #######
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/databases/post.db")

class Post
  include DataMapper::Resource
  property :id, Serial
  property :title, String, :required => true

  property :seo_slug, String, :required => true
  property :body, Text, :required => true
end

DataMapper.finalize.auto_upgrade!