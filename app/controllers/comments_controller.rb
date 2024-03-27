class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params) #投稿したコメントレコード取得
    if @comment.save
    redirect_to "/prototypes/#{@comment.prototype.id}"
    else
      #binding.pry
      @prototype = @comment.prototype #その投稿したコメントの投稿先のprototype情報を@prototypeに代入
      @comments = @prototype.comments #そのprototypeに紐づく全コメント取得
      render "/prototypes/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(prototype_id: params[:prototype_id], user_id: current_user.id)
  end

end
