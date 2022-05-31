class Opportunity < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :phase
  belongs_to :user
  belongs_to :company_area
  has_many :comments

  validates :phase_id, numericality: { equal_to: 1 }
  validates :company_area_id, numericality: { other_than: 1, message: "can't be blank"} 

end
