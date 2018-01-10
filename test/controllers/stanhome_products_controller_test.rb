require 'test_helper'

class StanhomeProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stanhome_product = stanhome_products(:one)
  end

  test "should get index" do
    get stanhome_products_url
    assert_response :success
  end

  test "should get new" do
    get new_stanhome_product_url
    assert_response :success
  end

  test "should create stanhome_product" do
    assert_difference('StanhomeProduct.count') do
      post stanhome_products_url, params: { stanhome_product: { product_name: @stanhome_product.product_name, quantity: @stanhome_product.quantity, reference: @stanhome_product.reference } }
    end

    assert_redirected_to stanhome_product_url(StanhomeProduct.last)
  end

  test "should show stanhome_product" do
    get stanhome_product_url(@stanhome_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_stanhome_product_url(@stanhome_product)
    assert_response :success
  end

  test "should update stanhome_product" do
    patch stanhome_product_url(@stanhome_product), params: { stanhome_product: { product_name: @stanhome_product.product_name, quantity: @stanhome_product.quantity, reference: @stanhome_product.reference } }
    assert_redirected_to stanhome_product_url(@stanhome_product)
  end

  test "should destroy stanhome_product" do
    assert_difference('StanhomeProduct.count', -1) do
      delete stanhome_product_url(@stanhome_product)
    end

    assert_redirected_to stanhome_products_url
  end
end
