# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Events" do
    describe "Admin" do
      describe "event_categories" do
        refinery_login_with :refinery_user

        describe "event_categories list" do
          before do
            FactoryGirl.create(:event_category, :name => "UniqueTitleOne")
            FactoryGirl.create(:event_category, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.events_admin_event_categories_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.events_admin_event_categories_path

            click_link "Add New Event Category"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Events::EventCategory.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Events::EventCategory.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:event_category, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.events_admin_event_categories_path

              click_link "Add New Event Category"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Events::EventCategory.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:event_category, :name => "A name") }

          it "should succeed" do
            visit refinery.events_admin_event_categories_path

            within ".actions" do
              click_link "Edit this event category"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:event_category, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.events_admin_event_categories_path

            click_link "Remove this event category forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Events::EventCategory.count.should == 0
          end
        end

      end
    end
  end
end
