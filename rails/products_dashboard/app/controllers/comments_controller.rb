class CommentsController < ApplicationController
  def index
      @comments = Comment.all.joins(:product).select("*")

  end

  def create
      product = Product.find(params[:id])
      Comment.create(comment:params[:comment], product:product)
      redirect_to "/products/#{params[:id]}"
    end
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to "/products/#{params[:product_id]}"
  end
  private
  def comment_params
      params.require(:comment).permit( :comment, :product)
  end

end
