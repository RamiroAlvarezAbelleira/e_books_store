class Book < ApplicationRecord
  include PgSearch::Model
  belongs_to :author
  belongs_to :publisher

  pg_search_scope :search,
    against: {
      title: 'A',
      isbn: 'B'
    },
    associated_against: {
      author: [:firstname, :lastname],
      publisher: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }

  validates :title, presence: true
  validates :price, presence: true
  validates :date_of_publication, presence: true

  validates_uniqueness_of :isbn, message: 'must be unique'

  validate :isbn_10_format_and_checksum

  def self.ransackable_attributes(auth_object = nil)
    %w[title date_of_publication] # List the attributes you want to allow for searching
  end

  private

  def isbn_10_format_and_checksum
    # Remove hyphens from the ISBN if present
    isbn_without_hyphens = isbn.gsub('-', '')

    # Ensure the ISBN is 10 characters long (after removing hyphens)
    if isbn_without_hyphens.length != 10
      errors.add(:isbn, 'must be 10 characters long')
      return
    end

    # Split the ISBN into an array of individual digits
    digits = isbn_without_hyphens.chars.map { |char| char == 'X' ? 10 : char.to_i }

    # Calculate the checksum
    checksum = (0..8).sum { |i| (i + 1) * digits[i] }

    # Calculate the expected checksum digit
    expected_checksum_digit = checksum % 11
    expected_checksum_digit = 'X' if expected_checksum_digit == 10 # Represent 10 as 'X'

    # Check if the last digit (the checksum) is correct
    unless digits[9] == expected_checksum_digit
      errors.add(:isbn, 'has an invalid checksum')
    end
  end
end