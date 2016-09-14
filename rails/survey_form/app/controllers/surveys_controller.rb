class SurveysController < ApplicationController
  def new
  end

  def create
      session[:count] = 1
  end

  def result

      @name = params[:name]
      @location = params[:location]
      @language = params[:language]
      @comment = params[:comment]
      flash.notice = "Thank you for submitting this form! You have submitted this form #{session[:count]+= 1} times now."
  end
end
