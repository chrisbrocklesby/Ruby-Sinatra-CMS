###### Post Index #######
get "/post/?" do
  @pageTitle = "Post Index"
  @posts = Post.paginate :page => params[:page], :per_page => 5, :order => [ :id.desc ], :published => true
  erb :"post/index"
end

###### Post Admin Area #######
get "/post/admin/?" do
  protected
  @pageTitle = "Post Admin"
  @posts = Post.paginate :page => params[:page], :per_page => 10, :order => [ :id.desc ]
  erb :"post/admin"
end

###### New Post ########
get "/post/new/?" do
  protected
  @pageTitle = "New Post"
  erb :"post/new"
end

post "/post/new/?" do
  protected
  data = Post.new
  data.title = params[:title]
  data.description = params[:description]
  data.slug = params[:slug]
  data.body = params[:body]
  data.published = params[:published]
  data.created_date = Time.now
  data.updated_date = Time.now

  if(data.save)
    redirect('/post')
  else
    status 500
  end 
end


###### Edit Post #######
get "/post/edit/:id/?" do
  protected
  @pageTitle = "Edit Post"
  @post = Post.get(params[:id]) # Get post by ID.
  erb :"post/edit"
end

post "/post/edit/:id/?" do
  protected
  data = Post.get(params[:id]).update(
    :title => params[:title],
    :description => params[:description], 
    :slug => params[:slug],
    :body => params[:body],
    :published => params[:published],
    :created_date => params[:created_date],
    :updated_date => Time.now
  )
  if(data)
    redirect('/post')
  else
    status 500
  end 
end


###### View Post #######
get "/post/:slug/?" do
  
  @post = Post.first(:slug => params[:slug])

  if @post
    erb :"post/view"
  else
    status 404
  end 
end


###### Delete Post #######
get "/post/delete/:id/?" do
  protected
  Post.get(params[:id]).destroy # Get post by ID then delete.
  redirect('/post')
end