require 'rails_helper'

RSpec.describe "admin/invitations/show", type: :view do
  before(:each) do
    @admin_invitation = assign(:admin_invitation, Invitation.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
