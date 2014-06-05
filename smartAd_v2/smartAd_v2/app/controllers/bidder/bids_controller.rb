class Bidder::BidsController < ApplicationController
  include Devise::Controllers::Helpers
  before_action :authenticate_user!
  layout 'bidder_home'
  
  require 'net/http'
  
  require 'net/http/post/multipart'
  
  def create_bids
    @bid = Bid.new
    @bid.bidder_id = current_user.id
    @bid.bid_amount = params[:amount]
    @bid.auction_id = params[:id]
    
    @auction = Auction.find(@bid.auction_id)
    
    if @bid.bid_amount < @auction.current_price + @auction.min_step_price
      flash[:error] = "Your Bid Amount is too LOW!"
      redirect_to bidder_root_path
    else
      if @bid.save
      
        @auction.update_attributes(current_price: @bid.bid_amount)
      
        flash[:notice] = "Successfully Placed Your Bid!"
        redirect_to bidder_root_path
      else
        flash[:error] = "Failed to Place Your Bid!"
        redirect_to bidder_root_path
      end
    end
    
  end
  
  def upload_bids_image
    @ad_image = AdImage.new
    @ad_image.image = params[:target]
    @ad_image.auction_id = params[:auction_id]
    
    @auction = Auction.find(@ad_image.auction_id)
    
    if @ad_image.save
      @auction.update_attributes(is_uploaded: true)
      
      for pt in @auction.product.product_types
        if pt.name == "kiosk"
          @pt_id = 1
        elsif pt.name == "spaceb"
          @pt_id = 2
        elsif pt.name == "beacon"
          @pt_id = 3
        end
      end
      
      
      @pic_name = "#{@ad_image.id}/original/#{@ad_image.image_file_name}"
        
    
      url = URI.parse('http://221.224.33.142:8089/SmartAD/UploadPic')
      File.open("./public/images/ad_images/#{@pic_name}") do |jpg|
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
      if @pt_id == 1
        request.body = custom_json_for(@res_pic_name)#data.to_json
      elsif @pt_id == 2
        request.body = custom_json_for2(@res_pic_name)
      else
        request.body = custom_json_for3(@res_pic_name)
      end
      puts request.body 
      response = http.request(request)
    
      puts response.body
    
    
      flash[:notice] = "Successfully Uploaded Your Ad!"
      redirect_to bidder_my_bids_path
    else
      flash[:error] = "Failed Uploaded Your Ad!"
      redirect_to bidder_my_bids_path
    end
  end
  
  
  def post_ad




    
  end
  
  private
  def custom_json_for(value)

    list = value.map do |client|
      { :type => '1',
        :position => '1',
        :pics => client.to_s
      }
    end
    list.to_json
  end
  def custom_json_for2(value)

    list = value.map do |client|
      { :type => '2',
        :position => '1',
        :pics => client.to_s
      }
    end
    list.to_json
  end
  
  def custom_json_for3(value)

    list = value.map do |client|
      { :type => '3',
        :position => '1',
        :pics => client.to_s
      }
    end
    list.to_json
  end
end
