require 'rails_helper'

RSpec.describe Admin::EventsController, type: :controller do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all admin_events as @admin_events" do
      event = Admin::Event.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:admin_events)).to eq([event])
    end
  end

  describe "GET #show" do
    it "assigns the requested admin_event as @admin_event" do
      event = Admin::Event.create! valid_attributes
      get :show, params: {id: event.to_param}, session: valid_session
      expect(assigns(:admin_event)).to eq(event)
    end
  end

  describe "GET #new" do
    it "assigns a new admin_event as @admin_event" do
      get :new, params: {}, session: valid_session
      expect(assigns(:admin_event)).to be_a_new(Admin::Event)
    end
  end

  describe "GET #edit" do
    it "assigns the requested admin_event as @admin_event" do
      event = Admin::Event.create! valid_attributes
      get :edit, params: {id: event.to_param}, session: valid_session
      expect(assigns(:admin_event)).to eq(event)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Admin::Event" do
        expect {
          post :create, params: {admin_event: valid_attributes}, session: valid_session
        }.to change(Admin::Event, :count).by(1)
      end

      it "assigns a newly created admin_event as @admin_event" do
        post :create, params: {admin_event: valid_attributes}, session: valid_session
        expect(assigns(:admin_event)).to be_a(Admin::Event)
        expect(assigns(:admin_event)).to be_persisted
      end

      it "redirects to the created admin_event" do
        post :create, params: {admin_event: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Admin::Event.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved admin_event as @admin_event" do
        post :create, params: {admin_event: invalid_attributes}, session: valid_session
        expect(assigns(:admin_event)).to be_a_new(Admin::Event)
      end

      it "re-renders the 'new' template" do
        post :create, params: {admin_event: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested admin_event" do
        event = Admin::Event.create! valid_attributes
        put :update, params: {id: event.to_param, admin_event: new_attributes}, session: valid_session
        event.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested admin_event as @admin_event" do
        event = Admin::Event.create! valid_attributes
        put :update, params: {id: event.to_param, admin_event: valid_attributes}, session: valid_session
        expect(assigns(:admin_event)).to eq(event)
      end

      it "redirects to the admin_event" do
        event = Admin::Event.create! valid_attributes
        put :update, params: {id: event.to_param, admin_event: valid_attributes}, session: valid_session
        expect(response).to redirect_to(event)
      end
    end

    context "with invalid params" do
      it "assigns the admin_event as @admin_event" do
        event = Admin::Event.create! valid_attributes
        put :update, params: {id: event.to_param, admin_event: invalid_attributes}, session: valid_session
        expect(assigns(:admin_event)).to eq(event)
      end

      it "re-renders the 'edit' template" do
        event = Admin::Event.create! valid_attributes
        put :update, params: {id: event.to_param, admin_event: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested admin_event" do
      event = Admin::Event.create! valid_attributes
      expect {
        delete :destroy, params: {id: event.to_param}, session: valid_session
      }.to change(Admin::Event, :count).by(-1)
    end

    it "redirects to the admin_events list" do
      event = Admin::Event.create! valid_attributes
      delete :destroy, params: {id: event.to_param}, session: valid_session
      expect(response).to redirect_to(admin_events_url)
    end
  end

end
