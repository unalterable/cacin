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
