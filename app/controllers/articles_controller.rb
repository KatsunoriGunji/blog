class ArticlesController < ApplicationController

  before_action :move_to_index, except: [:index, :show]
  before_action :set_article, only: [:destroy, :edit, :show, :update]

  def index
    @articles = Article.order("created_at DESC").page(params[:page]).per(5)
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.create(title: article_params[:title], text: article_params[:text], image: article_params[:image], user_id: article_params[:user_id])
    redirect_to "/"
  end

  def destroy
    if @article.user_id == current_user.id
      @article.destroy
    end
  end

  def edit
  end

  def update
    if @article.user_id == current_user.id
      @article.update(article_params)
      redirect_to "/"
    end
  end

  def show
  end

private
  def article_params
    params.require(:article).permit(:title, :image, :text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
