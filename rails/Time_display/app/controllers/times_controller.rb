class TimesController < ApplicationController
  def main
      @time = DateTime.current.to_formatted_s(:long)
  end
end
