# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Payment do
  it 'is invalid without any attribute values set' do
    expect(described_class.new).not_to be_valid
  end

  it 'is invalid without any value' do
    expect(described_class.new(value: 123)).not_to be_valid
  end

  it 'is invalid without any description' do
    expect(described_class.new(description: '1234')).not_to be_valid
  end
end
