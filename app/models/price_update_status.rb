class PriceUpdateStatus < ApplicationRecord
    # Ensure only one record is created
    def self.instance
      first_or_create
    end
end