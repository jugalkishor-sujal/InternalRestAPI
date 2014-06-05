class AuctionsController < ApplicationController
  include PortalModule
  before_filter :set_title
  
  def set_title
    @page_title = "Auctions Management"
  end
  
  
  def index
    @auctions = Auction.all
  end
  
  def show
    @auctions = Auction.all
    render :action => "index"
  end
  
  def new
    @title = "Add Auction"
    @auction = Auction.new
  end
  
  def edit
    @title = "Edit Auction"
    @auction = Auction.find(params[:id])
  end
  
  def create
    @auction = Auction.new(auction_params)
    if @auction.save
      redirect_to(:url => auction_path(@auction), :notice => 'Create Auction Successfully!')
    else
      render :action => "new"
    end
  end
  
  def update
    @auction = Auction.find(params[:id])
    
    if @auction.update_attributes(auction_params.reject{|k,v| v.blank?})
      
      redirect_to(:url => auction_path, :notice => 'Update Auction Successfully!')
    else
      render :action => "edit"
    end
  end

  def destroy
    @auction = Auction.find(params[:id])
    @auction.destroy
    
    redirect_to(auctions_url)
  end
  
  private
  
  def auction_params
    params.require(:auction).permit!
  end
end
