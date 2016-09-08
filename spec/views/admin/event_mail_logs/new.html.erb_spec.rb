require 'rails_helper'

RSpec.describe "admin/event_mail_logs/new", type: :view do
  before(:each) do
    assign(:admin_event_mail_log, EventMailLog.new())
  end

  it "renders new admin_event_mail_log form" do
    render

    assert_select "form[action=?][method=?]", event_mail_logs_path, "post" do
    end
  end
end
