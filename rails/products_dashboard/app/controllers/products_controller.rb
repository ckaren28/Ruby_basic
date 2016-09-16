class ProductsController < ApplicationController
  def index
      @products = Product.all
  end

  def show
      @product = Product.find(params[:id])
      @cat = Product.find(params[:id]).category
      @comments = @product.comments

  end

  def new
      @category = Category.all

  end

  def edit
      @product = Product.find(params[:id])
      @category = Category.all

  end

  def create
      category = Category.find(product_params[:category])
      product = Product.new(name:params[:name],description:params[:descriptione], pricing:params[:pricing], category:category)
      if product.save
          redirect_to '/'
      else
       flash[:error] = @product.errors.full_messages
       redirect_to '/products/new'
   end
  end

  def update
      category = Category.find(product_params[:category])
      Product.update(params[:id], name:params[:name],description:params[:descriptione], pricing:params[:pricing], category:category)
      redirect_to "/"
  end

  def destroy
      @product = Product.find(params[:id]).destroy
      redirect_to '/'
  end
  private
  def product_params
      params.require(:product).permit(:name, :description, :pricing, :category)
  end

end
