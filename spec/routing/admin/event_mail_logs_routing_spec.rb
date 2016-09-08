require "rails_helper"

RSpec.describe Admin::EventMailLogsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/event_mail_logs").to route_to("admin/event_mail_logs#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/event_mail_logs/new").to route_to("admin/event_mail_logs#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/event_mail_logs/1").to route_to("admin/event_mail_logs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/event_mail_logs/1/edit").to route_to("admin/event_mail_logs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/event_mail_logs").to route_to("admin/event_mail_logs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/event_mail_logs/1").to route_to("admin/event_mail_logs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/event_mail_logs/1").to route_to("admin/event_mail_logs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/event_mail_logs/1").to route_to("admin/event_mail_logs#destroy", :id => "1")
    end

  end
end
