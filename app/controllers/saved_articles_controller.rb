class SavedArticlesController < ApplicationController
  before_action :require_login
  def index
    @saved_articles = Current.user.saved_articles
  end

  def create
    @saved_article = Current.user.saved_articles.find_or_create_by(
      title: params[:saved_article][:title],
      url: params[:saved_article][:url],
      source: params[:saved_article][:source]
    )
    respond_to do |format|
    format.turbo_stream { render turbo_stream: turbo_stream.prepend("notices", partial: "shared/notice", locals: { notice: "Article saved!" }) }
    format.html { redirect_to news_index_path, notice: "Article saved for later!" }
  end
  end

  def destroy
    @saved_article = Current.user.saved_articles.find(params[:id])
    @saved_article.destroy
    redirect_to saved_articles_path, notice: "Article removed."
  end

  private
  def require_login
    redirect_to new_session_path unless authenticated?
  end
end
