# frozen_string_literal: true

namespace :tb do
  desc 'Loads menu item data from CSV'
  task bulk_load: :environment do
    require 'csv'
    CSV.foreach('data/items.csv', headers: true) do |row|
      MenuItem.create!(row.to_hash)
    end
  end
end
