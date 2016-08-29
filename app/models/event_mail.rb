class EventMail < ApplicationRecord
  belongs_to :event

  def html
    html_template
  end

  def plain_text
    plain_text_template
  end

end
