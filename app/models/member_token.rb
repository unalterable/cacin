class MemberToken < ApplicationRecord
  belongs_to :member
  belongs_to :event

  validates :member, presence: true
  validates :event, presence: true

  before_create { self.token = gen_token }

  def gen_token
    require 'securerandom'
    begin
      token = SecureRandom.urlsafe_base64
    end while MemberToken.find_by(token: token)
    token
  end

end
