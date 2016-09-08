require 'rails_helper'

RSpec.describe "Admin::EventMailLogs", type: :request do
  describe "GET /admin_event_mail_logs" do
    it "works! (now write some real specs)" do
      get admin_event_mail_logs_path
      expect(response).to have_http_status(200)
    end
  end
end
