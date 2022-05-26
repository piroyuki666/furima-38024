class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :item_info
    validates :item_category_id
    validates :item_sales_status_id
    validates :item_shipping_fee_status_id
    validates :item_prefecture_id
    validates :item_scheduled_delivery_id
  end

  #値段は「整数値」かつ「300〜9999999」の範囲に指定
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :item_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  belongs_to :user

  has_one_attached :image
end
