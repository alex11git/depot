class ProductsController < ApplicationController
  def index
    @products=Product.all
  end
  def show
    @product=Product.find(params[:id])
  end
  def new
    @product=Product.new
  end
  def create
    @product=Product.new(product_params)
    if @product.save
      redirect_to '/'
    else
      render action: :new
    end
  end
  def edit
    @product=Product.find(params[:id])
  end
  def update
    @product=Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to separated_product_path(params[:id])
    else
      render action: :edit
    end
  end

  def erase
    @product=Product.find(params[:id])
    @product.destroy
    redirect_to '/'
  end

  private
  def product_params
    params.require(:product).permit(:title,:description,:image_url,:price)
  end
end
