class WordsController < ApplicationController
  def main
      if session[:count] == nil
          session[:count] = 0
      else
          session[:count] += 1
      end
      @word = [*('A'..'Z')].sample(14).join
       "#{@word}"
  end


end
