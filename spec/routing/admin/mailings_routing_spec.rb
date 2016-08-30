require "rails_helper"

RSpec.describe Admin::MailingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/mailings").to route_to("admin/mailings#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/mailings/new").to route_to("admin/mailings#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/mailings/1").to route_to("admin/mailings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/mailings/1/edit").to route_to("admin/mailings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/mailings").to route_to("admin/mailings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/mailings/1").to route_to("admin/mailings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/mailings/1").to route_to("admin/mailings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/mailings/1").to route_to("admin/mailings#destroy", :id => "1")
    end

  end
end
