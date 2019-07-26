class CommentsController < ApplicationController

  before_action :correct_user, only: [:destroy]

  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.create(commnet_params)
    if @comment.save
      redirect_to item_path(@item)
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    @comment = Comment.find(params[:id])
    if  @comment.destroy
      redirect_to item_path(@item)
    else
      flash[:notice] =  "削除に失敗しました"
      redirect_to item_path(@item)
    end
  end

  
  def commnet_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    unless @comment
      redirect_to item_path
    end
  end

end
