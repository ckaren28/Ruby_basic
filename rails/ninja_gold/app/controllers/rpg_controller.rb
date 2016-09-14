class RpgController < ApplicationController
  def main
      if session[:gold] == nil
          session[:gold] = 0
          session[:log] = []
          session[:color] = []
      end
  end

  def farm
      time = Time.now.strftime("%Y/%m/%d %I:%M %p")
      num = rand(10...20)
      session[:gold] += num
      session[:color] << "green"
      session[:log] << "Earned #{num} from the farm! (#{time})"
      redirect_to '/'
  end

  def cave
      time = Time.now.strftime("%Y/%m/%d %I:%M %p")
      num = rand(5...10)
      session[:gold] += num
      session[:color] << "green"
      session[:log] << "Earned #{num} from the farm! (#{time})"

       redirect_to '/'
  end

  def casino
      time = Time.now.strftime("%Y/%m/%d %I:%M %p")
      num = rand(-50...50)
       session[:gold] += num
       if num > 0
           session[:color] << "green"
           session[:log] << "Earned #{num} from the casino! (#{time})"
       else
           session[:color] << "red"

           session[:log] << "Entered a casino and lost #{num} golds... ouchhh, bummmer. (#{time})"
       end
       redirect_to '/'
  end

  def house
      time = Time.now.strftime("%Y/%m/%d %I:%M %p")
      num = rand(2...5)
       session[:gold] += num
       session[:color] << "green"
       session[:log] << "Earned #{num} from the house! (#{time})"
       redirect_to '/'
  end
  def reset
      session[:gold] = nil
      session[:log] = nil
      redirect_to '/'
  end
end
