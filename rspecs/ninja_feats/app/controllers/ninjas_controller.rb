class NinjasController < ApplicationController
  def new
  end

  def create
     ninja = Ninja.new(name: params[:name], description: params[:description])
     if ninja.save
         redirect_to '/success'
     else
         flash[:errors] = ninja.errors.full_messages
         redirect_to '/'
     end
  end
  def success
      render :text => 'Form submitted successfully'
  end


end
