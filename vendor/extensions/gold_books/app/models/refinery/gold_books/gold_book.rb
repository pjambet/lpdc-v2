module Refinery
  module GoldBooks
    class GoldBook < Refinery::Core::BaseModel
      self.table_name = 'refinery_gold_books'

      attr_accessible :content, :author, :position

      acts_as_indexed :fields => [:content, :author]

      validates :content, :presence => true, :uniqueness => true
    end
  end
end
