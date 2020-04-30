# frozen_string_literal: true

class Payment < ApplicationRecord
  validates :description, presence: true, allow_blank: false
  validates :value, presence: true, allow_blank: false

  def to_json(options = {})
    attributes.transform_keys do |key|
      if /^deleted|imported$/.match?(key)
        "is_#{key}"
      else
        key
      end.camelize(:lower)
    end.to_json(options)
  end
end
