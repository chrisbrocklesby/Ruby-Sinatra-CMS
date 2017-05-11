###### File Index #######
get "/admin/files/?" do
	protected
	@files = Dir.glob("public/assets/uploads/*")
	erb :"upload/index", :layout => :layout_admin
end


###### New File ########
get "/file/new/?" do
	protected
	erb :"upload/upload", :layout => :layout_admin
end

post "/file/new/?" do halt 500 unless !params['file'].nil?
	protected
	file=nil
	upload_file = File.open('public/assets/uploads/' + params['file'][:filename], "wb") do |f|  
	f.write(params['file'][:tempfile].read)  
	end
	@file = params['file'][:filename]
	redirect('/admin/files')
end


###### Delete File ########
get "/file/delete/?" do
	protected
	File.delete(params['file'])
	redirect('/admin/files')
end