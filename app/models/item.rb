class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :purchase_record
  has_one_attached :image
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :send_day
  belongs_to :status




end