###### 404 Error ######
not_found do
	@pageTitle = "Sorry page not found"
	status 404
	erb :"error/404"
end

###### 500 Error ######
error 500 do
	@pageTitle = "Sorry something went wrong"
	status 500
	erb :"error/500"
end