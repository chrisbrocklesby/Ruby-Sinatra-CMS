###### 404 Error ######
not_found do
  status 404
  erb :"error/404"
end

###### 500 Error ######
error 500 do
  status 500
  erb :"error/500"
end