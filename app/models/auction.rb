class Auction < ApplicationRecord
  include AASM
  has_many :bids, dependent: :destroy
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }

  aasm :whiny_transitions => false do
    state :draft, initial: true
    state :published
    state :reserve_met
    state :won
    state :cancelled
    state :reserve_not_met

    event :submit do
      transitions :from => :draft, :to => :published
    end


    event :reserve_met do
      transitions :from => :published, :to => :reserve_met
    end

    event :won do
      transitions :from => :reserve_met, :to => :won
    end

    event :cancelled do
      transitions :from => :draft, :to => :cancelled
      transitions :from => :published, :to => :cancelled
    end

    event :reserve_not_met do
      transitions :from => :published, :to => :reserve_not_met
    end

  end

end
