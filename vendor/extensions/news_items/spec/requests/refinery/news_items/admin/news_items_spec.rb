# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "NewsItems" do
    describe "Admin" do
      describe "news_items" do
        login_refinery_user

        describe "news_items list" do
          before do
            FactoryGirl.create(:news_item, :title => "UniqueTitleOne")
            FactoryGirl.create(:news_item, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.news_items_admin_news_items_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.news_items_admin_news_items_path

            click_link "Add New News Item"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::NewsItems::NewsItem.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::NewsItems::NewsItem.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:news_item, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.news_items_admin_news_items_path

              click_link "Add New News Item"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::NewsItems::NewsItem.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:news_item, :title => "A title") }

          it "should succeed" do
            visit refinery.news_items_admin_news_items_path

            within ".actions" do
              click_link "Edit this news item"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:news_item, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.news_items_admin_news_items_path

            click_link "Remove this news item forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::NewsItems::NewsItem.count.should == 0
          end
        end

      end
    end
  end
end
