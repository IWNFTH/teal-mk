class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :opportunity

  validates :text, presence: true

end
