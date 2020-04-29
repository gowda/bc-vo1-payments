# frozen_string_literal: true

class Contract < ApplicationRecord
  has_many :payments
end
