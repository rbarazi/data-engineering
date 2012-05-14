class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(params[:order])
    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @order = Order.find(params[:id])

    if @order.update_attributes(params[:order])
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to orders_url
  end

  def import
    # binding.pry
  end

  def parse
    if params[:file].present? && @orders = Parser.new(params[:file].read).import_orders!
      @total = @orders.collect(&:total).sum
      redirect_to orders_url, notice: "Parsed #{@orders.size} orders with total gross revenue of #{@total}"
    else
      flash[:error] = 'Could not parse file.'
      render action: "import"
    end
  end
end
