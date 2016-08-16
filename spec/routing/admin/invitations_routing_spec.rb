require "rails_helper"

RSpec.describe Admin::InvitationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/invitations").to route_to("admin/invitations#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/invitations/new").to route_to("admin/invitations#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/invitations/1").to route_to("admin/invitations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/invitations/1/edit").to route_to("admin/invitations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/invitations").to route_to("admin/invitations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/invitations/1").to route_to("admin/invitations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/invitations/1").to route_to("admin/invitations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/invitations/1").to route_to("admin/invitations#destroy", :id => "1")
    end

  end
end
