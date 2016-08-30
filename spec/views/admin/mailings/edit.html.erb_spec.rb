require 'rails_helper'

RSpec.describe "admin/mailings/edit", type: :view do
  before(:each) do
    @admin_mailing = assign(:admin_mailing, Admin::Mailing.create!())
  end

  it "renders the edit admin_mailing form" do
    render

    assert_select "form[action=?][method=?]", admin_mailing_path(@admin_mailing), "post" do
    end
  end
end
