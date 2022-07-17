class CommentsController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!, only: %i[create]
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    if @comment.save
      redirect_to post_path(@post), notice: 'Se ha creado el comentario'
    else
      redirect_to post_path(@post), notice: 'No se pudo crear el comentario'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end
