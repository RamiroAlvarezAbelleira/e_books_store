class Author < ApplicationRecord
    has_many :books

    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :date_of_birth, presence: true

    def age
        return nil if date_of_birth.blank?
    
        today = Date.today
        dob = date_of_birth.to_date
        age = today.year - dob.year
    
        age -= 1 if today < dob + age.years
        age
    end

    def full_name
        full_name = "#{firstname} #{lastname}"
        full_name
    end

    def self.ransackable_attributes(auth_object = nil)
        %w[firstname date_of_birth] # List the attributes you want to allow for searching
    end

    def book_count
        books.count
    end

end
