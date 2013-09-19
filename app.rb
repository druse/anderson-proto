require "rubygems"
require "bundler/setup"
require "sinatra/base"
require "zurb-foundation"

class App < Sinatra::Base
  configure :production, :development do
    enable :logging
  end

  configure do
    Compass.configuration do |config|
      config.project_path = File.dirname __FILE__
      config.sass_dir = File.join "views", "scss"
      config.images_dir = File.join "views", "images"
      config.http_path = "/"
      config.http_images_path = "/images"
      config.http_stylesheets_path = "/stylesheets"
      config.line_comments = true
    end

    set :scss, Compass.sass_engine_options
  end

  get "/" do
    erb :guide, {:layout => :layoutGuide}
  end
  
    get "/collage" do
    erb :collage, {:layout => :layoutColl}
  end

get "/header" do
erb :header, {:layout => :layout}
end 

get "/events" do
erb :eventsListing, {:layout => :layout}
end 

get "/detail" do
erb :detail, {:layout => :layout}
end 

get "/home" do
erb :home, {:layout => :layout}
end

get "/home-alert" do
erb :homeAlert, {:layout => :layoutAlert}
end

get "/search-results" do
erb :searchResults, {:layout => :layout}
end

get "/guide" do
erb :guide, {:layout => :layoutGuide}
end

get "/guide-components" do
erb :guideComp, {:layout => :layoutGuide}
end

get "/guide-elements" do
erb :guideElem, {:layout => :layoutGuide}
end

get "/guide-layouts" do
erb :guideLayouts, {:layout => :layoutGuide}
end

  get "/stylesheets/*.css" do |path|
    content_type "text/css", charset: "utf-8"
    scss :"scss/#{path}"
  end
end

