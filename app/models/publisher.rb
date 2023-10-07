class Publisher < ApplicationRecord
    has_many :books

    validates :name, presence: true

    def self.ransackable_attributes(auth_object = nil)
        %w[ name ] # List the attributes you want to allow for searching
    end

    def book_count
        books.count
    end
end
