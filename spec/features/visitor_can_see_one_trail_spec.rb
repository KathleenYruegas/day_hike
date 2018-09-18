require "rails_helper"

describe "As a visitor" do
  describe "when I visit a trail show page" do
    it 'should show information about that trail' do
      trip_1 = Trip.create!(name: "Trip 1")
      trip_2 = Trip.create!(name: "Trip 2")
      trip_3 = Trip.create!(name: "Trip 3")
      trail = Trail.create!(name: "Mountain", length: 10, address: "123 Peak Dr")
      trip_1.trails << trail
      trip_3.trails << trail

      visit trail_path(trail)

      expect(page).to have_content(trip_1.name)
      expect(page).to have_content(trip_3.name)
      expect(page).to have_content(trip_1.total_distance)
      expect(page).to have_content(trip_3.total_distance)
      expect(page).to_not have_content(trip_2.name)
      expect(page).to have_content("Included in #{trail.trips.count} Hiking trips.")
    end
  end
end
