class BidsController < ApplicationController
  include PortalModule
  before_filter :set_title
  
  def set_title
    @page_title = "Bids Management"
  end
  
  
  def index
    @bids = Bid.all
  end
  
  def show
    @bids = Bid.all
    render :action => "index"
  end
  
  def new
    @title = "Add Bid"
    @bid = Bid.new
  end
  
  def edit
    @title = "Edit Bid"
    @bid = Bid.find(params[:id])
  end
  
  def create
    @bid = Bid.new(bid_params)
    if @bid.save
      redirect_to(:url => bid_path(@bid), :notice => 'Create Bid Successfully!')
    else
      render :action => "new"
    end
  end
  
  def update
    @bid = Bid.find(params[:id])
    
    if @bid.update_attributes(bid_params.reject{|k,v| v.blank?})
      
      redirect_to(:url => bid_path, :notice => 'Update Bid Successfully!')
    else
      render :action => "edit"
    end
  end

  def destroy
    @bid = Bid.find(params[:id])
    @bid.destroy
    
    redirect_to(bids_url)
  end
  
  private
  
  def bid_params
    params.require(:bid).permit!
  end
end
