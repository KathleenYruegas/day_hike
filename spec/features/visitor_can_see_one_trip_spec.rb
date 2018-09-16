require "rails_helper"

describe "when I visit trip show page" do
  it 'should show trails included in that trip' do
    trip = Trip.create(name: "ntibne")
    trail_1 = trip.trails.create(name: "trail name", length: 6, address: "2352 Trail Rd")
    trail_2 = trip.trails.create(name: "yuoweoe", length: 10, address: "73 Ridge path")
    trail_3 = trip.trails.create(name: "jdmene", length: 3, address: "903 Crest dr")

    visit trip_path(trip)

    expect(page).to have_content(trail_1.name)
    expect(page).to have_content("Length: #{trail_1.length}")
    expect(page).to have_content(trail_1.address)
    expect(page).to have_content(trail_2.name)
    expect(page).to have_content("Length: #{trail_2.length}")
    expect(page).to have_content(trail_2.address)
    expect(page).to have_content(trail_3.name)
    expect(page).to have_content("Length: #{trail_3.length}")
    expect(page).to have_content(trail_3.address)

    expect(page).to have_content("Total Trail Distance: #{trip.total_distance}")
    expect(page).to have_content("Average Trail Distance: #{trip.avg_trail_distance}")
    expect(page).to have_content("Longest Trail Distance: #{trip.longest_trail}")
  end
end
