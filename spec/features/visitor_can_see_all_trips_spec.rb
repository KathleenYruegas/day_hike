require "rails_helper"

describe "As a visitor" do
  describe "when I visit the hiking trips index" do
    it 'should show all hiking trips' do
      trip_1 = Trip.create(name: "ljdgjdg")
      trip_2 = Trip.create(name: "etutueoti")
      trip_3 = Trip.create(name: "mnxvbvv")

      visit trips_path

      expect(page).to have_content(trip_1.name)
      expect(page).to have_content(trip_2.name)
      expect(page).to have_content(trip_3.name)
    end
  end
end
