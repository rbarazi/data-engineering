require 'spec_helper'

describe OrdersController do
  login_user
  
  def valid_attributes
    { quantity: 123 }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OrdersController. Be sure to keep this updated too.
  def valid_session
    # {}
  end

  describe "GET index" do
    it "assigns all orders as @orders" do
      order = Order.create! valid_attributes
      get :index, {}, valid_session
      assigns(:orders).should eq([order])
    end
  end

  describe "GET import" do
    it "responss to get" do
      get :import, {}, valid_session
    end
  end

  describe "POST parse" do
    describe "with valid file" do
      it "creates new Orders" do
        expect {
          post :parse, { :file => fixture_file_upload('/files/example_input.tab','text/tab-separated-values')}, valid_session
        }.to change(Order, :count).by(4)
        response.should redirect_to(orders_url)
      end
    end

    describe "with invalid file" do
      it "re-renders the 'import' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Parser.any_instance.stub(:import_orders!).and_return(false)
        post :parse, { :file => nil }, valid_session
        response.should render_template("import")
      end
    end
  end

  describe "GET show" do
    it "assigns the requested order as @order" do
      order = Order.create! valid_attributes
      get :show, {:id => order.to_param}, valid_session
      assigns(:order).should eq(order)
    end
  end

  describe "GET new" do
    it "assigns a new order as @order" do
      get :new, {}, valid_session
      assigns(:order).should be_a_new(Order)
    end
  end

  describe "GET edit" do
    it "assigns the requested order as @order" do
      order = Order.create! valid_attributes
      get :edit, {:id => order.to_param}, valid_session
      assigns(:order).should eq(order)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Order" do
        expect {
          post :create, {:order => valid_attributes}, valid_session
        }.to change(Order, :count).by(1)
      end

      it "assigns a newly created order as @order" do
        post :create, {:order => valid_attributes}, valid_session
        assigns(:order).should be_a(Order)
        assigns(:order).should be_persisted
      end

      it "redirects to the created order" do
        post :create, {:order => valid_attributes}, valid_session
        response.should redirect_to(Order.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved order as @order" do
        # Trigger the behavior that occurs when invalid params are submitted
        Order.any_instance.stub(:save).and_return(false)
        post :create, {:order => {}}, valid_session
        assigns(:order).should be_a_new(Order)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Order.any_instance.stub(:save).and_return(false)
        post :create, {:order => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested order" do
        order = Order.create! valid_attributes
        # Assuming there are no other orders in the database, this
        # specifies that the Order created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Order.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => order.to_param, :order => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested order as @order" do
        order = Order.create! valid_attributes
        put :update, {:id => order.to_param, :order => valid_attributes}, valid_session
        assigns(:order).should eq(order)
      end

      it "redirects to the order" do
        order = Order.create! valid_attributes
        put :update, {:id => order.to_param, :order => valid_attributes}, valid_session
        response.should redirect_to(order)
      end
    end

    describe "with invalid params" do
      it "assigns the order as @order" do
        order = Order.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Order.any_instance.stub(:save).and_return(false)
        put :update, {:id => order.to_param, :order => {}}, valid_session
        assigns(:order).should eq(order)
      end

      it "re-renders the 'edit' template" do
        order = Order.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Order.any_instance.stub(:save).and_return(false)
        put :update, {:id => order.to_param, :order => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested order" do
      order = Order.create! valid_attributes
      expect {
        delete :destroy, {:id => order.to_param}, valid_session
      }.to change(Order, :count).by(-1)
    end

    it "redirects to the orders list" do
      order = Order.create! valid_attributes
      delete :destroy, {:id => order.to_param}, valid_session
      response.should redirect_to(orders_url)
    end
  end

end
