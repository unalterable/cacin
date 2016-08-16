class Member < ApplicationRecord
  require 'csv'

  def self.import_csv(file)
    CSV.foreach(file.path, headers: true).reverse_each do |row|
      member_hash = row.to_hash
      member_hash["email"] = clean_email(member_hash["email"]) if member_hash["email"]
      member = Member.where(email: member_hash["email"])
      if member.count > 0
        member.first.update_attributes(member_hash)
      else
        Member.create!(member_hash)
      end
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
