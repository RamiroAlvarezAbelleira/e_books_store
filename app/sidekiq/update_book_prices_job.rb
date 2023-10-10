class UpdateBookPricesJob
  include Sidekiq::Job

  def perform(publisher_id, type_of_update, percentage)
    publisher = Publisher.find(publisher_id)
    books = publisher.books
    puts "entre al job #{publisher_id}"
    if type_of_update == 'increase'
      books.each { |book| book.update(price: book.price * (1 + (percentage / 100))) }
    elsif type_of_update == 'decrease'
      books.each { |book| book.update(price: book.price * (1 - (percentage / 100))) }
    end
    puts "despues del job"

    PriceUpdateStatus.instance.update(price_update_completed: true)
  end
end
