###### Required Gems #######
require 'sinatra'
require 'data_mapper'
require 'will_paginate'
require 'will_paginate/data_mapper'

###### Required Controllers #######
require_relative 'controllers/error_controller'
require_relative 'controllers/page_controller'
require_relative 'controllers/post_controller'
require_relative 'controllers/upload_controller'

###### Required Models #######
require_relative 'models/post_model'

###### Required Helpers #######
require_relative 'helpers/auth_helper'

###### Configuration #######
set :environment, :development 
set :url, 'http://localhost:4567'
set :sitename, 'Website Name'