class MemberToken < ApplicationRecord
  belongs_to :member
  validates :member, presence: true

  before_create do
    self.token = gen_token
    p self.token
  end

  def gen_token
    require 'securerandom'
    begin
      token = SecureRandom.urlsafe_base64
    end while MemberToken.find_by(token: token)
    token
  end

end
