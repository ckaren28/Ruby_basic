class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendees, dependent: :destroy
  has_many :users, through: :attendees
  has_many :discussions, dependent: :destroy

  validates :name, :date, :location, presence: true
  validates_date :date, :on => :create, :on_or_after => :today



end
