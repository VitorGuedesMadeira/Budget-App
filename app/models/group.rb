class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :establishments

  validates :name, presence: true, uniqueness: { scope: :user }
  validates :icon, presence: true
end
