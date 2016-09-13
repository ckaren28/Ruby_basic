class SaysController < ApplicationController
  def index
       session[:count] = 1
      render text: "What do you want me to say???"
  end
  def times
          render text: "You've visited this url #{session[:count] += 1} times"

  end
  def reset
      session[:count] = nil
      render text: "Destroyed the session!"
  end
end
