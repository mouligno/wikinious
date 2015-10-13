class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :show, :update, :destroy]

    def create
      @article = Article.new(article_params)
      if @article.save
        flash[:notice] = "Article successfully created"
        redirect_to articles_path
      else
        flash[:alert] = "Article not saved."
        redirect_to new_article_path
      end

    end

    def destroy
      @article.destroy
      flash[:notice] = "Article successfully deleted"

      redirect_to articles_path
    end

    def edit
    end

    def index
      @articles = Article.all
    end

    def new
      @article = Article.new
    end

    def show
      @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    end

    def update
      @article.update(article_params)

      flash[:notice] = "Article successfully updated"
      redirect_to @article
    end

  private
    def article_params
      params.require(:article).permit(:title, :content)
    end

    def set_article
      @article = Article.find(params[:id])
    end
end
