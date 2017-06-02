class RealEstateProsController < ApplicationController
      before_action :authenticate_user!
      skip_before_action :authenticate_user!, :only => :login_bypass
      
  def index
    #Oops messed up naming conventions
    realtors = Realtors.realtor_search("#{params[:search]}")
    @realtypros = realtors.sort_by{|r| r[:office_name]}
    
    visitchk = Realtors.all
    
    @realtorcaption = []
    
    visitchk.each do |chk|
      if chk.go_visit?
        @realtorcaption.push(chk)
      else
      end
    end
  end
  
  def login_bypass
     realtors = Realtors.realtor_search("#{(params[:search])}")
    @realtypros = realtors.sort_by{|r| r[:office_name]}
    
    visitchk = Realtors.all
    
    @realtorcaption = []
    
    visitchk.each do |chk|
      if chk.go_visit?
        @realtorcaption.push(chk)
      else
      end
    end
    render 'index'
  end

  def show
    @realtypros = Realtors.find_by_id(params[:id])
  end

  def new
    @realtypros = Realtors.new
  end
  
  def create
    realtor_params[:office_name].upcase!
    @realtypros= Realtors.new(realtor_params)
    if @realtypros.save
      redirect_to(:action => 'index')
    else
      render 'new'
    end
  end
  
  def edit
    @realtors = Realtors.find(params[:id])
    if @realtors.last_visited == nil
      @lastv = "No Date Set"
    else
      @lastv = @realtors.last_visited
    end
  end

  def update
    @realtypros = Realtors.find(params[:id])
    if @realtypros.update_attributes(realtor_params)
      redirect_to(:action => 'show', :id => params[:id] )
    else
      @realtypros.errors.full_messages.each do |msg|
        flash[:notice] = msg
      end
      
      redirect_to(:action => 'edit', :id => params[:id])
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
  params.require(:realtors).permit(:office_name, :office_phone, :last_visited, :office_address, :email, :broker, :contact_name, :notes, :visit_needed)
end