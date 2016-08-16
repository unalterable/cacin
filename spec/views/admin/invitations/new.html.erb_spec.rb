require 'rails_helper'

RSpec.describe "admin/invitations/new", type: :view do
  before(:each) do
    assign(:admin_invitation, Invitation.new())
  end

  it "renders new admin_invitation form" do
    render

    assert_select "form[action=?][method=?]", invitations_path, "post" do
    end
  end
end
