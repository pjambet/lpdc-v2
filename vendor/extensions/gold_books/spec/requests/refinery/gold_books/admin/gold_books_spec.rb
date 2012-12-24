# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "GoldBooks" do
    describe "Admin" do
      describe "gold_books" do
        login_refinery_user

        describe "gold_books list" do
          before do
            FactoryGirl.create(:gold_book, :author => "UniqueTitleOne")
            FactoryGirl.create(:gold_book, :author => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.gold_books_admin_gold_books_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.gold_books_admin_gold_books_path

            click_link "Add New Gold Book"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Author", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::GoldBooks::GoldBook.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Author can't be blank")
              Refinery::GoldBooks::GoldBook.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:gold_book, :author => "UniqueTitle") }

            it "should fail" do
              visit refinery.gold_books_admin_gold_books_path

              click_link "Add New Gold Book"

              fill_in "Author", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::GoldBooks::GoldBook.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:gold_book, :author => "A author") }

          it "should succeed" do
            visit refinery.gold_books_admin_gold_books_path

            within ".actions" do
              click_link "Edit this gold book"
            end

            fill_in "Author", :with => "A different author"
            click_button "Save"

            page.should have_content("'A different author' was successfully updated.")
            page.should have_no_content("A author")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:gold_book, :author => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.gold_books_admin_gold_books_path

            click_link "Remove this gold book forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::GoldBooks::GoldBook.count.should == 0
          end
        end

      end
    end
  end
end
