class Customers::CartsController < ApplicationController
  def index
    @carts = current_customer.carts
    @customer = current_customer
    @tax = Tax.find(2).tax
  end

  def create
    @addcart = Cart.new(cart_params)
    @addcart.customer_id = current_customer.id
    @addcart.save
    redirect_to customers_carts_path

    # binding.pry
    # p "hhhhhh"
    # @addcart = add_cart(params[:cart][:item_count],params[:cart][:product_id])
    # @addcart.save
    # redirect_to customers_carts_path
  end

  def add_cart(item_count,product_id)
    # ジャッジさせたcart_existを元に
    # frueなら個数のみ追加登録（＋）
    if cart_exist(params[:cart][:product_id])
      cart = Cart.new
      cart.customer_id = current_customer.id
      cart.product_id = product_id
      cart.item_count = item_count
    # falseなら空のカラムを渡して新しくカートへ登録
    else
      cart = Cart.find_by(product_id:product_id)
      cart.item_count += item_count
    end
    return cart
  end

    # 現在のカート内に登録しようとしているproduct_idがないかジャッジさせる
  def cart_exist(product_id)
    @carts = Cart.where(customer_id:current_customer.id)
    @carts.each do |p|
      if product_id == p.product_id
        return true
      else
        return false
      end
    end
  end

 # m=Memo.find(1)探して見つけて呼び出して
 # m.body="aaaaaaaaaaaaaaaaa"個数を追加してクリエイトして
 # m.saveセーブする


  def update
    @cart = Cart.find(params[:id])
    @cart.update(cart_params)
    redirect_to customers_carts_path
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to customers_carts_path
  end

  def all_destroy
    @carts = current_customer.carts
    @carts.delete_all
    redirect_to customers_carts_path
  end

  def cart_params
    params.require(:cart).permit(:item_count, :customer_id, :product_id)
  end
end
