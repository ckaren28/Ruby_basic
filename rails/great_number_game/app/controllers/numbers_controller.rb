class NumbersController < ApplicationController
  def main
      if session[:randnum] == nil
          session[:randnum] = rand(1...100)
      end
      @guess = params[:num].to_i
      if @guess == session[:randnum]
          flash[:message] = "You guessed the right number"
          session.clear
      elsif @guess > session[:randnum]
          flash[:message] = "Too High"
      else
          flash[:message] = "Too Low"
    end
    end
end
