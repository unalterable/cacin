class MemberToken < ApplicationRecord
  belongs_to :member, required: true
  belongs_to :rsvp, required: false

  before_create { self.token = gen_token }

  def gen_token
    require 'securerandom'
    begin
      token = SecureRandom.urlsafe_base64
    end while MemberToken.find_by(token: token)
    token
  end

  def add_notes(new_notes)
    old_notes = notes || ""
    datetime = DateTime.now.strftime("%H:%M  %d-%b-%y")
    new_notes = "#{ datetime }: #{ new_notes }"
    new_notes = " \n" + new_notes unless old_notes == ""
    update(notes: old_notes + new_notes)
    self
  end


end
