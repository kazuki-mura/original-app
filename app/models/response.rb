class Response < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'イマイチ(2ヶ月後)' },
    { id: 3, name: 'まぁまぁ(1ヶ月後)' },
    { id: 4, name: '良かった(2週間後)' },
    { id: 5, name: '非常に良かった(10日後)' },
    { id: 6, name: 'その他' },
  ]
  
  include ActiveHash::Associations
  has_many :schedules
  
  end