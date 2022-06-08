class Opportunity < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :phase
  belongs_to :user
  belongs_to :company_area
  has_many :comments

  validates :op_name, presence: true
  validates :company, presence: true
  validates :company_area_id, numericality: { other_than: 1, message: "can't be blank" }
end
