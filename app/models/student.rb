class Student < ActiveRecord::Base
  has_many :participations, dependent: :destroy
  has_many :subject_items, through: :participations
  has_many :subject_item_notes, dependent: :destroy

  validates :first_name, :last_name, presence: true
  validates :birthdate, date: { before: proc { Time.now }, allow_blank: true,
                                message: 'must be earlier than today' }

  accepts_nested_attributes_for :subject_items
end
