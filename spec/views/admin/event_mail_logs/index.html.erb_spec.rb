require 'rails_helper'

RSpec.describe "admin/event_mail_logs/index", type: :view do
  before(:each) do
    assign(:event_mail_logs, [
      EventMailLog.create!(),
      EventMailLog.create!()
    ])
  end

  it "renders a list of admin/event_mail_logs" do
    render
  end
end
