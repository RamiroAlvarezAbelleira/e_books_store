class Author < ApplicationRecord
    has_many :books

    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :date_of_birth, presence: true
end
