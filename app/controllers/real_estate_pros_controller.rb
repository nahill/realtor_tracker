class RealEstateProsController < ApplicationController
  def index
   # @realtypros = Realtors.all.order(:office_name)
    #Need to below code to work and display correctly
  @search = Realtors.search do
    fulltext(params[:search])
    paginate :page => 1, :per_page => 30
  end
  @realtypros = @search.results
 
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