require 'rails_helper'

RSpec.describe "admin/event_mail_logs/edit", type: :view do
  before(:each) do
    @admin_event_mail_log = assign(:admin_event_mail_log, EventMailLog.create!())
  end

  it "renders the edit admin_event_mail_log form" do
    render

    assert_select "form[action=?][method=?]", admin_event_mail_log_path(@admin_event_mail_log), "post" do
    end
  end
end
