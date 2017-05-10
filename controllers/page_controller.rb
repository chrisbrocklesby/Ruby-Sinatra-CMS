###### Home #######
get "/?" do
  	@pageTitle = "Home Page"
  	erb :home
end

###### XML Site Map #######
get "/sitemap.xml" do
	@posts = Post.all(:published => true)
	content_type 'text/xml'
  	erb :sitemap, :layout => false
end

###### XML Site Map #######
get "/rss.xml" do
	@posts = Post.all(:published => true)
	content_type 'text/xml'
  	erb :rss, :layout => false
end