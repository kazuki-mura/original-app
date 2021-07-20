class Schedule < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :content
  belongs_to :product
  belongs_to :response

  # validates :title, :text, presence: true
  with_options presence: true do
    validates :client


    with_options numericality: { other_than: 1 , message: "can't be blank"}  do
      validates :content_id
      validates :product_id
      validates :response_id
    end
  end

  belongs_to :user

end
