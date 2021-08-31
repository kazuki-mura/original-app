class Schedule < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :content
  belongs_to :product

  # validates :title, :text, presence: true
  with_options presence: true do
    validates :client
    validates :visit_date

    with_options numericality: { other_than: 1 , message: "can't be blank"}  do
      validates :content_id
      validates :product_id
    end
  end

  belongs_to :user

end
