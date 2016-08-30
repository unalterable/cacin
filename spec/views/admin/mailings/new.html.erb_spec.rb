require 'rails_helper'

RSpec.describe "admin/mailings/new", type: :view do
  before(:each) do
    assign(:admin_mailing, Admin::Mailing.new())
  end

  it "renders new admin_mailing form" do
    render

    assert_select "form[action=?][method=?]", admin_mailings_path, "post" do
    end
  end
end
