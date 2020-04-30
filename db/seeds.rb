# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

contracts = []
10.times do
  contracts << Contract.create!(label: Faker::Lorem.sentence(word_count: 3 + rand(4)))
end

contracts.each do |contract|
  count = rand(40)
  count.times do
    contract.payments.create!(
      value: rand(700) - 350, description: Faker::Lorem.sentence
    )
  end
end
