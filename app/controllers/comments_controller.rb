class CommentsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.new(commnet_params)
    if @comment.save
      redirect_to item_path(@item)
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to item_path(@item)
    else
      flash[:notice] =  "削除に失敗しました"
      redirect_to item_path(@item)
    end
  end

  private
  
  def commnet_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end
