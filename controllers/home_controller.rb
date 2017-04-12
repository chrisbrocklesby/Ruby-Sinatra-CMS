###### Home #######
get "/?" do
  @pageTitle = "Home Page"
  erb :home
end