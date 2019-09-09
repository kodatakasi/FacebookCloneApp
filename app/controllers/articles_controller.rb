class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @user = User.find_by(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = session[:user_id]
    if params[:back]
      rener :new
    else
      if @article.save
        redirect_to articles_path
      else
        @user = User.find_by(params[:id])
        render new_article_path
      end
    end
  end

  def new
    @user = User.find_by(params[:id])
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_path
    else
      render :edit
    end
  end

  def confirm
    @article = Article.new(article_params)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:image, :image_cache, :content)
  end

end
