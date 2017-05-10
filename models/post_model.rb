###### Post Model #######
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/databases/post.db")

class Post
  	include DataMapper::Resource
 	property :id, Serial
 	property :published, Boolean, :default  => false
  	property :title, String, :required => true
  	property :description, String, :required => true
	property :slug, String, :required => true, unique_index: true
  	property :body, Text, :required => true
  	property :created_date, DateTime, :required => true
  	property :updated_date, DateTime, :required => true
end

DataMapper.finalize.auto_upgrade!