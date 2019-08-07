class Adress < ApplicationRecord
  belongs_to :contact, required: false
end
