require "net/http"
require "json"

class NewsController < ApplicationController
  before_action :require_login
  def index
    if params[:q].present?
      api_key = Rails.application.credentials[:news_api][:key]
      Rails.logger.info "Loaded API key: #{api_key}"
      url = URI("https://newsapi.org/v2/everything?q=#{URI.encode_www_form_component(params[:q])}&apiKey=#{api_key}&pageSize=10")
      response = Net::HTTP.get(url)
      data = JSON.parse(response)
      Rails.logger.info "NewsAPI response: #{data.inspect}"
      if data["status"] == "ok"
        @articles = data["articles"]
      else
        @articles = []
        flash.now[:alert] = data["message"] if data["message"]
      end
    else
      @articles = []
    end
  end

  private
  def require_login
    redirect_to new_session_path unless authenticated?
  end
end
