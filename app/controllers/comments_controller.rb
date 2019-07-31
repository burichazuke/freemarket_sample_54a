class CommentsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.create(commnet_params)
    if @comment.save
      redirect_to item_path(@item)
    end
  end

  private 
  
  def commnet_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end
