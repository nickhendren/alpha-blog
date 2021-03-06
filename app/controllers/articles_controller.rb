class ArticlesController < ApplicationController

  before_filter :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @article = Article.paginate(page: params[:page], per_page: 2)
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article was succssfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    if @article.update_attributes(article_params)
      flash[:success] = "Article was successfully updated."
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @article.destroy
    flash[:danger] = "Article was successfully deleted."
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
