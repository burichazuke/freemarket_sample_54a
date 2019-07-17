class CommentsController < ApplicationController

  def create
    @item = Item.find(paramas[:id])
    @comment = @item.comments.new(commnet_params)
    if @comment.save
      redirect_to controller: "items", action: "show"
    end

  end

  private commnet_params
  prams.permit(:content).marge(user_id: current_user_id)


end
