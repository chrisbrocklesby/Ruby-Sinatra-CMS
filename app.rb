###### Required Gems #######
require 'sinatra'
require 'data_mapper'
require 'will_paginate'
require 'will_paginate/data_mapper'

###### Required Controllers #######
require_relative 'controllers/home_controller'
require_relative 'controllers/error_controller'
require_relative 'controllers/post_controller'

###### Required Models #######
require_relative 'models/post_model'