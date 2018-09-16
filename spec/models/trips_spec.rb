require "rails_helper"

describe Trip, type: :model do
  describe 'relationships' do
    it { should have_many(:trip_trails) }
    it { should have_many(:trails), through: :trip_trails }
  end

  describe 'instance methods' do
    before(:each) do
      @trip = Trip.create(name: "ntibne")
      @trail_1 = @trip.trails.create(name: "trail name", length: 6, address: "2352 Trail Rd")
      @trail_2 = @trip.trails.create(name: "yuoweoe", length: 10, address: "73 Ridge path")
      @trail_3 = @trip.trails.create(name: "jdmene", length: 3, address: "903 Crest dr")

    end
    context '#total_distance' do
      it 'should give total of all trails on hike' do
        expect(@trip.total_distance).to eq(@trail_1.length + @trail_2.length + @trail_3.length)
      end
    end
    context '#avg_trail_distance' do
      it 'should give average of length of trails on hike' do
        expect(@trip.avg_trail_distance).to eq((@trip.total_distance/@trip.trails.count).round)
      end
    end
    context '#longest_trail' do
      it 'should show longest trail distance' do
        expect(@trip.longest_trail).to eq(@trail_2.length)
      end
    end
  end
end
