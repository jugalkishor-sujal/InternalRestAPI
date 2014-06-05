class ProductsController < ApplicationController
  include PortalModule
  before_filter :set_title
  
  def set_title
    @page_title = "Products Management"
  end
  
  
  def index
    @products = Product.all
  end
  
  def show
    @products = Product.all
    render :action => "index"
  end
  
  def new
    @title = "Add Product"
    @product = Product.new
    @categories = Product.uniq.pluck(:name)
  end
  
  def edit
    @title = "Edit Product"
    @product = Product.find(params[:id])
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to(:url => product_path(@product), :notice => 'Create Product Successfully!')
    else
      render :action => "new"
    end
  end
  
  def update
    @product = Product.find(params[:id])
    
    if @product.update_attributes(product_params.reject{|k,v| v.blank?})
      
      redirect_to(:url => product_path, :notice => 'Update Product Successfully!')
    else
      render :action => "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    
    redirect_to(products_url)
  end
  
  def sales
    @products = Product.all
  end
  
  def product_graph
    @product = Product.find(params[:id])
    
  end
  
  def product_calendar
    @product = Product.find(params[:id])
    
  end
  def view_counts

    @products = Product.all
    
  end
  
  
  #For Tags autocomplete
  def product_type
    @product_type = Product.product_type_counts.where("name like ?", "%#{params[:term]}%")
    respond_to do |format|
        format.html
        format.json { render json: custom_json_for(@product_type) }
    end
  end
  
  def product_option
    @product_type = Product.product_option_counts.where("name like ?", "%#{params[:term]}%")
    respond_to do |format|
        format.html
        format.json { render json: custom_json_for(@product_type) }
    end
  end
  
  def format
    @product_type = Product.format_counts.where("name like ?", "%#{params[:term]}%")
    respond_to do |format|
        format.html
        format.json { render json: custom_json_for(@product_type) }
    end
  end
  
  def form_factor
    @product_type = Product.form_factor_counts.where("name like ?", "%#{params[:term]}%")
    respond_to do |format|
        format.html
        format.json { render json: custom_json_for(@product_type) }
    end
  end
  
  def time_share
    @product_type = Product.time_share_counts.where("name like ?", "%#{params[:term]}%")
    respond_to do |format|
        format.html
        format.json { render json: custom_json_for(@product_type) }
    end
  end
  
  def grade
    @product_type = Product.grade_counts.where("name like ?", "%#{params[:term]}%")
    respond_to do |format|
        format.html
        format.json { render json: custom_json_for(@product_type) }
    end
  end
  
  def period
    @product_type = Product.period_counts.where("name like ?", "%#{params[:term]}%")
    respond_to do |format|
        format.html
        format.json { render json: custom_json_for(@product_type) }
    end
  end
  
  private
  
  def product_params
    params.require(:product).permit!
  end
  
  def custom_json_for(value)
    list = value.map do |client|
      {
        :label => client.name.to_s,
        :value => client.name.to_s
      }
    end
    list.to_json
  end
end
