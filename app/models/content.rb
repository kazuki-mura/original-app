class Content < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: ' 受注活動' },
    { id: 3, name: 'スペック活動' },
    { id: 4, name: '設計変更活動' },
    { id: 5, name: '納品' },
    { id: 6, name: '打ち合わせ' },
    { id: 7, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :schedules
  end