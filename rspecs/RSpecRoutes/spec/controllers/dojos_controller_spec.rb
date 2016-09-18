require 'rails_helper'

RSpec.describe DojosController, type: :controller do

  describe "GET #index" do
    it "routes /dojos/index to the dojos controller" do
      expect(:get => "/dojos/index").to route_to(:controller =>"dojos", :action => "index")
    end
  end
  describe "GET #world" do
    it "routes /dojos/world to the world page" do
      expect(:get => "/dojos/world").to route_to(:controller => "dojos", :action => "world")
    end
  end
  describe "GET #ninjas" do
      it "returns routes /dojos/ninjas to the ninjas page" do
        expect(:get => "/dojos/ninjas").to route_to(:controller => "dojos", :action => "ninjas")
        end
    end
end
