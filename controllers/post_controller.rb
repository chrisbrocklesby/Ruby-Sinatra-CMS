###### Post Index #######
get "/post/?" do
  @pageTitle = "Post Index"
  @posts = Post.paginate :page => params[:page], :per_page => 4, :order => [ :id.desc ]
  erb :"post/index"
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
  data.slug = params[:slug]
  data.body = params[:body]
  
  # Upload File
  if (params['file'])
    params['file'].length.times do |i|
      File.open('public/assets/uploads/' + params['file'][i][:filename], "w") do |f|
        f.write(params['file'][i][:tempfile].read)
      end
    end
  end

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
    :slug => params[:slug], 
    :body => params[:body]
  )
  if(data)
    redirect('/post')
  else
    status 500
  end 
end


###### View Post #######
get "/post/:slug/?" do
  @pageTitle = "View Post"
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