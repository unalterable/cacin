require 'rails_helper'

RSpec.describe "admin/invitations/edit", type: :view do
  before(:each) do
    @admin_invitation = assign(:admin_invitation, Invitation.create!())
  end

  it "renders the edit admin_invitation form" do
    render

    assert_select "form[action=?][method=?]", admin_invitation_path(@admin_invitation), "post" do
    end
  end
end
