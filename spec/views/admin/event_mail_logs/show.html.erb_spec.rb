require 'rails_helper'

RSpec.describe "admin/event_mail_logs/show", type: :view do
  before(:each) do
    @admin_event_mail_log = assign(:admin_event_mail_log, EventMailLog.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
