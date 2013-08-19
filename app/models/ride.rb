class Ride < ActiveRecord::Base
validates_presence_of :I_am, :Starting_From, :Going_to, :depart, :Price, :Seats
belongs_to :users
has_many :requests, :dependent => :destroy
default_scope -> { order('depart DESC') }
validate :depart_date_cannot_be_in_the_past

  def depart_date_cannot_be_in_the_past
    if depart < Date.today
      errors.add(:depart, "can't be in the past")
    end
  end
end
