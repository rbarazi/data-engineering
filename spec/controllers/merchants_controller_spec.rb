require 'spec_helper'

describe MerchantsController do

  def valid_attributes
    { name: 'ABC', address: 'DEF' }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MerchantsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all merchants as @merchants" do
      merchant = Merchant.create! valid_attributes
      get :index, {}, valid_session
      assigns(:merchants).should eq([merchant])
    end
  end

  describe "GET show" do
    it "assigns the requested merchant as @merchant" do
      merchant = Merchant.create! valid_attributes
      get :show, {:id => merchant.to_param}, valid_session
      assigns(:merchant).should eq(merchant)
    end
  end

  describe "GET new" do
    it "assigns a new merchant as @merchant" do
      get :new, {}, valid_session
      assigns(:merchant).should be_a_new(Merchant)
    end
  end

  describe "GET edit" do
    it "assigns the requested merchant as @merchant" do
      merchant = Merchant.create! valid_attributes
      get :edit, {:id => merchant.to_param}, valid_session
      assigns(:merchant).should eq(merchant)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Merchant" do
        expect {
          post :create, {:merchant => valid_attributes}, valid_session
        }.to change(Merchant, :count).by(1)
      end

      it "assigns a newly created merchant as @merchant" do
        post :create, {:merchant => valid_attributes}, valid_session
        assigns(:merchant).should be_a(Merchant)
        assigns(:merchant).should be_persisted
      end

      it "redirects to the created merchant" do
        post :create, {:merchant => valid_attributes}, valid_session
        response.should redirect_to(Merchant.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved merchant as @merchant" do
        # Trigger the behavior that occurs when invalid params are submitted
        Merchant.any_instance.stub(:save).and_return(false)
        post :create, {:merchant => {}}, valid_session
        assigns(:merchant).should be_a_new(Merchant)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Merchant.any_instance.stub(:save).and_return(false)
        post :create, {:merchant => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested merchant" do
        merchant = Merchant.create! valid_attributes
        # Assuming there are no other merchants in the database, this
        # specifies that the Merchant created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Merchant.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => merchant.to_param, :merchant => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested merchant as @merchant" do
        merchant = Merchant.create! valid_attributes
        put :update, {:id => merchant.to_param, :merchant => valid_attributes}, valid_session
        assigns(:merchant).should eq(merchant)
      end

      it "redirects to the merchant" do
        merchant = Merchant.create! valid_attributes
        put :update, {:id => merchant.to_param, :merchant => valid_attributes}, valid_session
        response.should redirect_to(merchant)
      end
    end

    describe "with invalid params" do
      it "assigns the merchant as @merchant" do
        merchant = Merchant.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Merchant.any_instance.stub(:save).and_return(false)
        put :update, {:id => merchant.to_param, :merchant => {}}, valid_session
        assigns(:merchant).should eq(merchant)
      end

      it "re-renders the 'edit' template" do
        merchant = Merchant.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Merchant.any_instance.stub(:save).and_return(false)
        put :update, {:id => merchant.to_param, :merchant => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested merchant" do
      merchant = Merchant.create! valid_attributes
      expect {
        delete :destroy, {:id => merchant.to_param}, valid_session
      }.to change(Merchant, :count).by(-1)
    end

    it "redirects to the merchants list" do
      merchant = Merchant.create! valid_attributes
      delete :destroy, {:id => merchant.to_param}, valid_session
      response.should redirect_to(merchants_url)
    end
  end

end
