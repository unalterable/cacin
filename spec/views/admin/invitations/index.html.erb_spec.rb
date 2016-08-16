require 'rails_helper'

RSpec.describe "admin/invitations/index", type: :view do
  before(:each) do
    assign(:invitations, [
      Invitation.create!(),
      Invitation.create!()
    ])
  end

  it "renders a list of admin/invitations" do
    render
  end
end
