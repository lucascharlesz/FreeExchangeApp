class Category < ApplicationRecord

    validates :description, presence: true

    scope :active_items, -> { where(active: true) }
end
