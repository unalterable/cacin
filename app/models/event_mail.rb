class EventMail < ApplicationRecord
  belongs_to :event

  def render_html(args)
    html_template
  end

  def render_plain_text(args)
    plain_text_template
  end
end
