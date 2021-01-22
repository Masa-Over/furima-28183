class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :name, length: {maximum: 40}
    validates :explanation, length: {maximum: 1000}
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to:9999999}
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :send_day_id, numericality: { other_than: 1 }
    validates :image
  end

  belongs_to :user
  has_one :purchase_record
  has_one_attached :image
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :send_day
  belongs_to :status




end