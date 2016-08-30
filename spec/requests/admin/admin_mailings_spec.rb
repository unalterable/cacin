require 'rails_helper'

RSpec.describe "Admin::Mailings", type: :request do
  describe "GET /admin_mailings" do
    it "works! (now write some real specs)" do
      get admin_mailings_path
      expect(response).to have_http_status(200)
    end
  end
end
