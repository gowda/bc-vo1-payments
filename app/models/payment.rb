# frozen_string_literal: true

class Payment < ApplicationRecord
  before_create :set_time

  validates :description, presence: true, allow_blank: false
  validates :value, presence: true, allow_blank: false

  def serializable_attributes
    attributes.transform_keys do |key|
      if /^deleted|imported$/.match?(key)
        "is_#{key}"
      else
        key
      end.camelize(:lower)
    end
  end

  def to_json(options = {})
    serializable_attributes.to_json(options)
  end

  private

  def set_time
    self.time = Time.now
  end
end
