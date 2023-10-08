class Search < ApplicationRecord
  belongs_to :searchable, polymorphic: true
end
