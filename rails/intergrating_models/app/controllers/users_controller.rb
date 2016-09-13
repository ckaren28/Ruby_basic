class UsersController < ApplicationController
  def index
  	render json: User.all
  end

  def show
  	render json: User.find(params[:id])
  end

  def new

  end

  def create
    @rand_names = ['Howard','Andy', 'Emily', 'Cole', 'Nancy', 'Arnold', 'Jamie', 'Tori', 'Henry', 'Lilly', 'Rose', 'Bernard']
    @names = [*('A'..'Z')].sample(8).join

  	User.create(name: @rand_names.sample)
    # User.create(name: @names)
  	redirect_to '/users'
  end

  def total
  	total = User.all.length
  	render text: "The total numbers of users is #{total}"
  end

  def edit
  	@user = User.find(params[:id])
  	puts @user
  	render 'edit'
  end
end
