class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_gold_book_item

  def load_gold_book_item
    @gold_book = Refinery::GoldBooks::GoldBook.new
  end
end

