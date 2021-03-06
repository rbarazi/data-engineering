require 'spec_helper'

describe PurchasersController do
  login_user

  def valid_attributes
    { name: 'ABC' }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PurchasersController. Be sure to keep this updated too.
  def valid_session
    # {}
  end

  describe "GET index" do
    it "assigns all purchasers as @purchasers" do
      purchaser = Purchaser.create! valid_attributes
      get :index, {}, valid_session
      assigns(:purchasers).should eq([purchaser])
    end
  end

  describe "GET show" do
    it "assigns the requested purchaser as @purchaser" do
      purchaser = Purchaser.create! valid_attributes
      get :show, {:id => purchaser.to_param}, valid_session
      assigns(:purchaser).should eq(purchaser)
    end
  end

  describe "GET new" do
    it "assigns a new purchaser as @purchaser" do
      get :new, {}, valid_session
      assigns(:purchaser).should be_a_new(Purchaser)
    end
  end

  describe "GET edit" do
    it "assigns the requested purchaser as @purchaser" do
      purchaser = Purchaser.create! valid_attributes
      get :edit, {:id => purchaser.to_param}, valid_session
      assigns(:purchaser).should eq(purchaser)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Purchaser" do
        expect {
          post :create, {:purchaser => valid_attributes}, valid_session
        }.to change(Purchaser, :count).by(1)
      end

      it "assigns a newly created purchaser as @purchaser" do
        post :create, {:purchaser => valid_attributes}, valid_session
        assigns(:purchaser).should be_a(Purchaser)
        assigns(:purchaser).should be_persisted
      end

      it "redirects to the created purchaser" do
        post :create, {:purchaser => valid_attributes}, valid_session
        response.should redirect_to(Purchaser.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved purchaser as @purchaser" do
        # Trigger the behavior that occurs when invalid params are submitted
        Purchaser.any_instance.stub(:save).and_return(false)
        post :create, {:purchaser => {}}, valid_session
        assigns(:purchaser).should be_a_new(Purchaser)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Purchaser.any_instance.stub(:save).and_return(false)
        post :create, {:purchaser => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested purchaser" do
        purchaser = Purchaser.create! valid_attributes
        # Assuming there are no other purchasers in the database, this
        # specifies that the Purchaser created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Purchaser.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => purchaser.to_param, :purchaser => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested purchaser as @purchaser" do
        purchaser = Purchaser.create! valid_attributes
        put :update, {:id => purchaser.to_param, :purchaser => valid_attributes}, valid_session
        assigns(:purchaser).should eq(purchaser)
      end

      it "redirects to the purchaser" do
        purchaser = Purchaser.create! valid_attributes
        put :update, {:id => purchaser.to_param, :purchaser => valid_attributes}, valid_session
        response.should redirect_to(purchaser)
      end
    end

    describe "with invalid params" do
      it "assigns the purchaser as @purchaser" do
        purchaser = Purchaser.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Purchaser.any_instance.stub(:save).and_return(false)
        put :update, {:id => purchaser.to_param, :purchaser => {}}, valid_session
        assigns(:purchaser).should eq(purchaser)
      end

      it "re-renders the 'edit' template" do
        purchaser = Purchaser.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Purchaser.any_instance.stub(:save).and_return(false)
        put :update, {:id => purchaser.to_param, :purchaser => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested purchaser" do
      purchaser = Purchaser.create! valid_attributes
      expect {
        delete :destroy, {:id => purchaser.to_param}, valid_session
      }.to change(Purchaser, :count).by(-1)
    end

    it "redirects to the purchasers list" do
      purchaser = Purchaser.create! valid_attributes
      delete :destroy, {:id => purchaser.to_param}, valid_session
      response.should redirect_to(purchasers_url)
    end
  end

end
