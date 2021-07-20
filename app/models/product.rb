class Product < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'GRシリーズ' },
    { id: 3, name: 'ダクバイル' },
    { id: 4, name: 'スチール透水蓋' },
    { id: 5, name: '伸縮装置' },
    { id: 6, name: '水平カッター' },
    { id: 7, name: '三井金属' },
    { id: 8, name: 'シルムネッツ' },
    { id: 9, name: '管洗浄、管更生' },
    { id: 10, name: '治山' },
    { id: 11, name: '温泉' },
  ]

  include ActiveHash::Associations
  has_many :schedules
  
  end