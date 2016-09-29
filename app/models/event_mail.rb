class EventMail < ApplicationRecord
  belongs_to :event


  def render_html(args = {})
    Mustache.render(html_template, template_vars(args))
  end

  def render_plain_text(args = {})
    Mustache.render(plain_text_template, template_vars(args))
  end

  def html_sample
    render_html(sample_vars)
  end

  def plain_text_sample
    render_plain_text(sample_vars)
  end

  Log = Struct.new(:date, :member_id, :email, :event_mail_id)

  def logs
    (YAML.load(yaml_logs || "--- []\n")).map{|log| Log.new(log[:date], log[:member_id], log[:email], id)}
  end

  def add_logs(members)
    newLogs = members.map{|m| {date: Time.now, member_id: m.id, email: m.email} }
    update( yaml_logs: (logs + newLogs).to_yaml )
  end

  private

    def sample_vars
      { location: event.location,
        token: "********SAMPLE TOKEN**********",
        rsvp_url: "http://google.com/?q=sample"}
    end

    def template_vars(args)
      { location: event.location,
        token: args[:token],
        rsvp_url: args[:rsvp_url]}
    end
end
