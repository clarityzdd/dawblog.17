class CommentsController < ApplicationController
  before_action :load_article
  
  def create
    @comment = @article.comments.new(comment_params)
    if @comment.save
      redirect_to @article, notice: 'gracias por su comentario'
    else
      redirect_to @article, alert: 'no ha sido posible añadir el comentario'
    end
  end
  
  def destroy
    @comment = @article.comments.find_by_id(params[:id])
    @comment.destroy
    redirect_to @article, notice: "comentario eliminado"
  end
  
  private
    def load_article
      @article = Article.find_by_id(params[:article_id])
    end
    def comment_params
      params.require(:comment).permit(:name, :email, :body)
    end
end
