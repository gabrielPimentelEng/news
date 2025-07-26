class ProductsController < ApplicationController
  # Populate @products for show edit and update actions
  before_action :set_product, only: %i[ show edit update destroy]
  before_action :require_login
  # allow not logged users to view products
  allow_unauthenticated_access only: %i[ index show ]

  def index
    @products = Product.all
  end

  def show
    # @product = Product.find(params[:id]) # This is set by the before_action
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @product = Product.find(params[:id]) # This is set by the before_action
  end

  def update
    # @product = Product.find(params[:id]) # This is set by the before_action
    if @product.update(product_params)
        redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.expect(product: [ :name ])
    end

    def require_login
    redirect_to new_session_path unless authenticated?
    end
end
