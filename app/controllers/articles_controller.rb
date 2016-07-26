class ArticlesController < ApplicationController
  def index
    @articles = Article.page(params[:page])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end
  
  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.order("id desc").page(params[:page])
    @comment = Comment.new
  end
  
  def create
    @article = Article.new(params_article)
    if @article.save
        flash[:notice] = "Success Add Records"
        redirect_to action: 'index'
    else
        flash[:error] = "data not valid"
        render 'new'
    end
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(params_article)
        flash[:notice] = "Success Update Records"
        redirect_to action: 'index'
    else
        flash[:error] = "data not valid"
        render 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
        flash[:notice] = "Success Delete a Record"
        redirect_to action: 'index'
    else
        flash[:error] = "Fails Delete a Record"
        redirect_to action: 'index'
    end
  end

  private
    def params_article
        params.require(:article).permit(:title, :content, :status, :picture)
    end
end
