class Schedule < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :content
  belongs_to :product
  
  with_options presence: true do
    validates :client
    validates :visit_date
    
    with_options numericality: { other_than: 1 , message: "can't be blank"}  do
      validates :content_id
      validates :product_id
    end
  end
  
  belongs_to :user

  # validate :visit_start_check 

  # private

  # def visit_start_check
  #     errors.add(:start_time, "は開始時刻より遅い時間を選択してください") if self.visit_date > self.start_time
  # end


end
