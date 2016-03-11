class RealEstateProsController < ApplicationController
      before_action :authenticate_user!

  def index
    #Oops messed up naming conventions
    realtors = Realtors.realtor_search("#{(params[:search])}")

  @realtypros = realtors.sort_by{|r| r[:office_name]}
  end

  def show
    @realtypros = Realtors.find_by_id(params[:id])
  end

  def new
    @realtypros = Realtors.new
  end
  
  def create
    @realtypros= Realtors.new(realtor_params)
    if @realtypros.save
      redirect_to(:action => 'index')
    else
      render 'new'
    end
  end
  
  def edit
    @realtors = Realtors.find(params[:id])
  end

  def update
    @realtypros = Realtors.find(params[:id])
    if  @realtypros.update_attributes(realtor_params)
      redirect_to(:action => 'index')
    else
      render 'edit'
    end
  end
  
  def delete
    
  end
  
  def destroy
    @realtypros = Realtors.find(params[:id])
    if @realtypros.destroy
      redirect_to(:action => 'index')
    else
      redirect_to(:action => 'show', :id => params[:id] )
    end
  end
    
end


 private 

def realtor_params
  params.require(:realtors).permit(:office_name, :office_phone,)
end