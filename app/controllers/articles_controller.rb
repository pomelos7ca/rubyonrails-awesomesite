class ArticlesController < ApplicationController
  #启用简单HTTP 身份验证系统 用户名和密码正确才可访问 除index和show之外都必须验证才可访问
  http_basic_authenticate_with name:"summit",password:'123qwe',except:[:index,:show]
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

  def destroy 
    @article = Article.find(params[:id])
    # 如果在model中设置了 dependent: :destroy 会自动删除关联对象 -_-!
    #-------------------------------------------------------------
    # @comment=Comment.where(article_id:@article.id)
    # if !@comment.blank? #如果评论不为空,则循环删除
    #   @comment.each do |c|
    #     c.destroy
    #   end
    # end
    #-------------------------------------------------------------
    @article.destroy

    #render json:@article json方式输出  还有xml: html: plain:等...

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title,:text)
    end

end
