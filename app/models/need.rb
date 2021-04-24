class Need < ApplicationRecord
  belongs_to: foreigner
  with_options presence: true do
    validates :title
    validates :detail
  end
end
