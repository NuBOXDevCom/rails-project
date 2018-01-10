class StanhomeProductsController < ApplicationController
  load_and_authorize_resource param_method: :stanhome_product_params

  def index
    @stanhome_products = StanhomeProduct.all
  end

  def new
    @stanhome_product = StanhomeProduct.new
  end

  def edit;
  end

  def create
    @stanhome_product = StanhomeProduct.new(stanhome_product_params)
    if @stanhome_product.save
      redirect_to stanhome_products_path, success: 'Produit ajouté avec succès'
    else
      render :new
    end
  end

  def update
    if @stanhome_product.update(stanhome_product_params)
      redirect_to stanhome_products_path, success: 'Produit mis à jour avec succès'
    else
      render :edit
    end
  end

  def destroy
    @stanhome_product.destroy
    redirect_to stanhome_products_url, success: 'Produit supprimé avec succès'
  end

  private

  def stanhome_product_params
    params.require(:stanhome_product).permit(:reference, :product_name, :quantity)
  end
end
