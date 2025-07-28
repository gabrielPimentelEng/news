require "net/http"
require "json"

class NewsController < ApplicationController
  before_action :require_login
  def index
    if params[:q].present?
      page = params[:page].to_i > 0 ? params[:page].to_i : 1
      api_key = Rails.application.credentials[:news_api][:key]
      Rails.logger.info "Loaded API key: #{api_key}"
      url = URI("https://newsapi.org/v2/everything?q=#{URI.encode_www_form_component(params[:q])}&apiKey=#{api_key}&pageSize=10&page=#{page}")
      response = Net::HTTP.get(url)
      data = JSON.parse(response)
      Rails.logger.info "NewsAPI response: #{data.inspect}"
      if data["status"] == "ok"
        @articles = data["articles"]
        @total_results = data["totalResults"]
        @current_page = page
        @total_pages = (@total_results / 10.0).ceil
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
