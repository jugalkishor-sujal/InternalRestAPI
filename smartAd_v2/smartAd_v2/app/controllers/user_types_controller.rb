class UserTypesController < ApplicationController
  include PortalModule
  before_filter :set_title
  
  def set_title
    @page_title = "user_types Management"
  end
  
  
  def index
    @user_types = UserType.all
  end
  
  def show
    @user_types = UserType.all
    render :action => "index"
  end
  
  def new
    @title = "Add user_type"
    @user_type = UserType.new
  end
  
  def edit
    @title = "Edit user_type"
    @user_type = UserType.find(params[:id])
  end
  
  def create
    @user_type = UserType.new(user_type_params)
    if @user_type.save
      redirect_to(:url => user_type_path(@user_type), :notice => 'Create user type Successfully!')
    else
      render :action => "new"
    end
  end
  
  def update
    @user_type = UserType.find(params[:id])
    
    if @user_type.update_attributes(user_type_params.reject{|k,v| v.blank?})
      
      redirect_to(:url => user_type_path, :notice => 'Update user type Successfully!')
    else
      render :action => "edit"
    end
  end

  def destroy
    @user_type = UserType.find(params[:id])
    @user_type.destroy
    
    redirect_to(user_types_url)
  end
  
  private
  
  def user_type_params
    params.require(:user_type).permit!
  end
end
