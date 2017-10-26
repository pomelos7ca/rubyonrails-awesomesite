class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article=Article.new
  end

  def edit
    @article=Article.find(params[:id])
  end

  def create
    #render plain: params[:article].inspect
    #@article = Article.new(params[:article])
    @article = Article.new(article_params)

    #@article.save
    #redirect_to @article

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article=Article.find(params[:id])
    # @article.update(title: 'A new title') 仅更新title属性 update_attribute也是可以的 http://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
    
  end

  private
    def article_params
      params.require(:article).permit(:title,:text)
    end

end
