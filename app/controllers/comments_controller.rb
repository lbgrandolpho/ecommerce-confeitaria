class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @flavor = Flavor.find(params[:flavor_id])
    @comment = @flavor.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @flavor, notice: "Comentário adicionado!"
    else
      redirect_to @flavor, alert: "Erro ao adicionar comentário."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :image)
  end
end
