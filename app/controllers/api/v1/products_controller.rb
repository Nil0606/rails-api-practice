class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only:[:show,:update,:destroy]
  
  def index
    @products = Product.all
    render json: @products, status: 200
  end

  def page
    @products = Product.get_product_page(params[:id].to_i)
    render json: @products, status:200
  end

  def show
    render json: @product, status: 200
  end

  def create
    @product = Product.new(product_params)
    if @product.save
        render json: @product, status: 200
    else
        render json: { error: "unable to create product." }, status: 400
    end
  end

  def update
    if @product.update(product_params)
      render json: @product, status: 200
    else
      render json: { error: "product can't be updated." }, status: 400
    end
  end

  def destroy
    if @product.destroy
        render json: { message: 'Product successfully deleted.' }, status: 200
    else
        render json: { error: 'Unable to delete user.' }, status: 400
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :company, :price)
  end

end
