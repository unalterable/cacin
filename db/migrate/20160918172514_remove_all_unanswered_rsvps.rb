class RemoveAllUnansweredRsvps < ActiveRecord::Migration[5.0]
  def up
    Rsvp.all.each do |rsvp|
      rsvp.destroy if rsvp.status == 'unanswered'
    end
  end

  def down
  end
end
