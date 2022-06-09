class Opportunity < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :phase
  belongs_to :user
  belongs_to :company_area
  has_many :comments

  validates :op_name, presence: true
  validates :company, presence: true
  validates :company_area_id, numericality: { other_than: 1, message: "can't be blank" }

  def estimated_approximate_profit
    if estimated_sales_amount != ""
      estimated_sales_amount * 0.15
    else
      0
    end
  end
  
  def approximate_profit
    if sales_amount != ""
      sales_amount * 0.15
    else
      0
    end
  end
  
  def set_profit
      {:estimated_approximate_profit => estimated_approximate_profit, :approximate_profit => approximate_profit }
  end
end