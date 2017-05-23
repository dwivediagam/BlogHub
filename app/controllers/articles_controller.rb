class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :destroy, :update, :show]
  
  def new
    @article = Article.new
  end
  
  def create
    debugger
    @article = Article.new(article_params)
    @article.user = User.find(2)
    if @article.save
      flash[:success] = 'Article was successfully created'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def index
    @articles = Article.all
  end
  def show
  end
  
  def destroy
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end
    
  def edit
  end
  
  def update
    if @article.update(article_params)
      flash[:success] = "Article was successfully edited"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  private
    def set_article
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :description)
    end
  
end