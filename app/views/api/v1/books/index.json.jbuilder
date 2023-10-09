json.array!(@books) do |book|
  json.extract! book, :id, :title, :isbn, :date_of_publication, :author, :publisher, :review, :price
end