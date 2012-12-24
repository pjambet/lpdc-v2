require 'spec_helper'

module Refinery
  module GoldBooks
    describe GoldBook do
      describe "validations" do
        subject do
          FactoryGirl.create(:gold_book,
          :author => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:author) { should == "Refinery CMS" }
      end
    end
  end
end
