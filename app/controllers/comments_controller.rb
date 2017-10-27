class CommentsController < ApplicationController
    # 启用简单HTTP 身份验证系统 用户名和密码正确才可访问 仅有登录后才可访问destroy
    http_basic_authenticate_with name:"summit",password:'123qwe',only: :destroy
    def create
        @article=Article.find(params[:article_id])
        @comment=@article.comments.create(comment_params)
        redirect_to article_path(@article)
    end

    def destroy
        @article=Article.find(params[:article_id])
        @comment=@article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end

    private
        def comment_params
            params.require(:comment).permit(:commenter,:body)
        end
end
