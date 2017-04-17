###### Post Index #######
get "/post/?" do
  @pageTitle = "Post Index"
  # @posts = Post.all # Get all posts.
  @posts = Post.paginate :page => params[:page], :per_page => 10
  erb :"post/index"
end


###### New Post #######
get "/post/new/?" do
  @pageTitle = "New Post"
  erb :"post/new"
end

post "/post/new/?" do
  data = Post.new
  data.title = params[:title]
  data.seo_slug = params[:seo_slug]
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
  @pageTitle = "Edit Post"
  @post = Post.get(params[:id]) # Get post by ID.
  erb :"post/edit"
end

post "/post/edit/:id/?" do
  data = Post.get(params[:id]).update(
    :title => params[:title], 
    :seo_slug => params[:seo_slug], 
    :body => params[:body]
  )
  
  if(data)
    redirect('/post')
  else
    status 500
  end 
end


###### View Post #######
get "/post/:id/?" do
  @pageTitle = "View Post"
  @post = Post.get(params[:id]) # Get post by ID.
  erb :"post/view"
end


###### Delete Post #######
get "/post/delete/:id/?" do
  Post.get(params[:id]).destroy # Get post by ID then delete.
  redirect('/post')
end