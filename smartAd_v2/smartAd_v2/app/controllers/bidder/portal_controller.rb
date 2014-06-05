class Bidder::PortalController < ApplicationController
  include Devise::Controllers::Helpers
  before_action :authenticate_user!
  before_action :check_finish_bids, only: [:my_bids]
  layout 'bidder_home'
  
  def index
    #puts params[:fixed_product_type]
    #if params[:fixed_product_type] == 'on'
    #  @products = Product.where(id: 3)
    #else
    #  @products = Product.all
    #end
    
    #offset = rand(Product.count)
    #@products = Product.offset(rand(Product.count))
    
    if params[:fixed_product_type] == 'on'
      #@auctions = Auction.where("status = ? AND end_at > ?", 1, Date.today)
      @products = Product.tagged_with("Fixed", :on => :product_types)
    else
      #@auctions = Auction.where("status = ? AND end_at > ?", 1, Date.today)
      @products = Product.all
    end
  end
  
  def my_bids
    @total_bids = Bid.select(:auction_id).distinct.where(:bidder_id => current_user.id)
    @open_bids = 0
    for tb in @total_bids
      if tb.auction.end_at.to_date > DateTime.now.to_date
        @open_bids += 1
      end
    end
    
    @win_bids = Auction.where(winner: current_user.id)
    
    #@bids = Bid.where(:bidder_id => current_user.id)
  end
  
  def check_finish_bids
    @auctions = Auction.where('end_at <= ? and winner is NULL ', DateTime.now.strftime("%Y-%m-%d %H:%M:%S")) 
    for a in @auctions
      if Bid.where(auction_id: a.id).count > 0
        a.winner = Bid.where(auction_id: a.id, bid_amount: a.current_price).first.bidder_id
        a.update_attributes(winner: a.winner, status: 2)
      end
    end
  end
end
