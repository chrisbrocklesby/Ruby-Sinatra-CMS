get "/upload/?" do
	protected
	erb :"upload/upload", :layout => false
end


post "/upload/?" do halt 500 unless !params['file'].nil?
	protected
	file=nil
	upload_file = File.open('public/assets/uploads/' + params['file'][:filename], "wb") do |f|  
	f.write(params['file'][:tempfile].read)  
	end
	@file = params['file'][:filename]
	erb :"upload/result", :layout => false
end