class PurchasersController < ApplicationController

  def index
    @purchasers = Purchaser.all
  end

  def show
    @purchaser = Purchaser.find(params[:id])
  end

  def new
    @purchaser = Purchaser.new
  end

  def edit
    @purchaser = Purchaser.find(params[:id])
  end

  def create
    @purchaser = Purchaser.new(params[:purchaser])

    if @purchaser.save
      redirect_to @purchaser, notice: 'Purchaser was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @purchaser = Purchaser.find(params[:id])

    if @purchaser.update_attributes(params[:purchaser])
      redirect_to @purchaser, notice: 'Purchaser was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @purchaser = Purchaser.find(params[:id])
    @purchaser.destroy

    redirect_to purchasers_url
  end
end
