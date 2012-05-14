class MerchantsController < ApplicationController

  def index
    @merchants = Merchant.all
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def new
    @merchant = Merchant.new
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def create
    @merchant = Merchant.new(params[:merchant])

    if @merchant.save
      redirect_to @merchant, notice: 'Merchant was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @merchant = Merchant.find(params[:id])

    if @merchant.update_attributes(params[:merchant])
      redirect_to @merchant, notice: 'Merchant was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @merchant = Merchant.find(params[:id])
    @merchant.destroy

    redirect_to merchants_url
  end
end
