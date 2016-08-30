require 'rails_helper'

RSpec.describe "admin/mailings/index", type: :view do
  before(:each) do
    assign(:admin_mailings, [
      Admin::Mailing.create!(),
      Admin::Mailing.create!()
    ])
  end

  it "renders a list of admin/mailings" do
    render
  end
end
