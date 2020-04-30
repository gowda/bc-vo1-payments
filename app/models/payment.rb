# frozen_string_literal: true

class Payment < ApplicationRecord
  validates :description, presence: true, allow_blank: false
  validates :value, presence: true, allow_blank: false
end
