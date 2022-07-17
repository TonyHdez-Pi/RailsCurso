class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy]
  before_action :authenticate_user!, only: %i[new create update destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post), notice: 'Se ha creado un Post'
    else
      flash.now[:notice] = 'Hubo un error al crear el Post'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Se ha actualizado un post'
    else
      flash.now[:notice] = 'Hubo un error al actualizar el post'
    end
      render :edit, status: :unprocessable_entity
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path, notice: 'Se ha eliminado el post'
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
