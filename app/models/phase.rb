class Phase < ActiveHash::Base
  self.data = [
    { id: 1, name: '案件情報調査' },
    { id: 2, name: '参加判断' },
    { id: 3, name: '商談' },
    { id: 4, name: '条件合意' },
    { id: 5, name: '契約締結' },
    { id: 6, name: '成約' },
    { id: 7, name: '失注' }
  ]

  include ActiveHash::Associations
  has_many :opportunities
end
