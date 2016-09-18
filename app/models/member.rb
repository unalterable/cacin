class Member < ApplicationRecord

  before_create { self.token = Member.gen_unique_token }
  after_create { add_notes('Created')}

  has_many :rsvps
  has_many :event_mail_logs

  validates :email, uniqueness: true

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates_presence_of :first_name, :last_name, :job_title, :organisation, :email, if: 'member_input'

  attr_accessor :member_input

  # move into methods that use it?
  require 'csv'

  def self.gen_unique_token
    require 'securerandom'
    begin
      token = SecureRandom.urlsafe_base64
    end while Member.find_by(token: token)
    token
  end

  def good_contact?
    (first_name && first_name.length > 0) ||
    (last_name && last_name.length > 0) ||
    (organisation && organisation.length > 0)
  end

  def add_notes(new_notes)
    old_notes = notes || ""
    datetime = DateTime.now.strftime("%H:%M  %d-%b-%y")
    new_notes = "#{ datetime }: #{ new_notes }"
    new_notes = " \n" + new_notes unless old_notes == ""
    update(notes: old_notes + new_notes)
    self
  end

  def self.find_by_dirty_email_address(string)
    Member.find_by(email: Member.clean_email(string))
  end

  def self.import_csv(file)
    CSV.foreach(file.path, headers: true).each do |row|
      member_hash = row.to_hash
      member_hash["email"] = clean_email(member_hash["email"]) if member_hash["email"]
      Member.create!(member_hash) unless !!Member.find_by(email: member_hash["email"])
    end
  end

  def self.clean_email(email)
    email.scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i).first
  end

  def self.to_csv
    CSV.generate(headers: true) do |csv|
      csv << attribute_names
      all.each do |member|
        csv << attribute_names.map{ |attr| member.send(attr) }
      end
    end
  end
end
