require 'rails_helper'

RSpec.describe "admin/mailings/show", type: :view do
  before(:each) do
    @admin_mailing = assign(:admin_mailing, Admin::Mailing.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
