class PortalController < ApplicationController
  include PortalModule
  #include Devise::Controllers::Helpers
  #before_action :authenticate_user!
  require 'net/http'
  
  require 'net/http/post/multipart'
  
  def index
    
  end
  
  def post_ad


    if params[:id] == "1"
      @pic_name = "Kiosk1.jpg"
    elsif params[:id] == "2"
      @pic_name = "spaceb2.jpg"
    else
      @pic_name = "beacon1.jpg"
    end
    
    url = URI.parse('http://221.224.33.142:8089/SmartAD/UploadPic')
    File.open("./public/testing/#{@pic_name}") do |jpg|
      req = Net::HTTP::Post::Multipart.new url.path,
        "file" => UploadIO.new(jpg, "image/jpg", @pic_name)
      res = Net::HTTP.start(url.host, url.port) do |http|
        p_res = http.request(req)
        puts p_res.body
        puts JSON.parse(p_res.body)
        @res_pic_name = JSON.parse(p_res.body)
      end
    end
    
    
    
    uri = URI('http://221.224.33.142:8089/SmartAD/SetAds')
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json'})
    if params[:id] == "1"
      request.body = custom_json_for(@res_pic_name)#data.to_json
    elsif params[:id] == "2"
      request.body = custom_json_for2(@res_pic_name)
    else
      request.body = custom_json_for3(@res_pic_name)
    end
    puts request.body 
    response = http.request(request)
    
    puts response.body
    

    
  end
  
  private
  def custom_json_for(value)

    list = value.map do |client|
      { :type => '1',
        :position => '1',
        :pics => client.to_s
      }
    end

    #list = [{ 'type' => '1', 'position' => '1', 'pics' => res_pic_name.to_s}]
    list.to_json
  end
  
  def custom_json_for2(value)

    list = value.map do |client|
      { :type => '2',
        :position => '1',
        :pics => client.to_s
      }
    end

    #list = [{ 'type' => '1', 'position' => '1', 'pics' => res_pic_name.to_s}]
    list.to_json
  end
  
  def custom_json_for3(value)

    list = value.map do |client|
      { :type => '3',
        :position => '1',
        :pics => client.to_s
      }
    end

    #list = [{ 'type' => '1', 'position' => '1', 'pics' => res_pic_name.to_s}]
    list.to_json
  end
end
