class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_gold_book_item, :anti_spam

  def load_gold_book_item
    @gold_book = Refinery::GoldBooks::GoldBook.new
  end


  def anti_spam
    session['antispam_timestamp'] ||= Time.now
  end
end

