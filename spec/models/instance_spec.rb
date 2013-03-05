# == Schema Information
#
# Table name: instances
#
#  id              :integer          not null, primary key
#  instructable_id :integer
#  start_time      :datetime
#  end_time        :datetime
#  location        :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe Instance do
  describe "updates end time" do
    before :each do
      @instructable = create(:instructable, duration: 6)
      @instance = @instructable.instances.create(start_time: '2013-01-01 00:00:00', location: "There")
    end

    it "updates end time on save" do
      @instance.end_time.to_s(:number).should == Time.parse('2013-01-01 06:00:00').to_s(:number)
      @instance.start_time = '2013-01-01 01:00:00'
      @instance.save!
      @instance.end_time.to_s(:number).should == Time.parse('2013-01-01 07:00:00').to_s(:number)
    end
  end

  describe '#formatted_location' do
    it "renders private camp correctly" do
      instructable = create(:instructable, location_type: 'private-camp', camp_reason: 'because', camp_address: 'N06', camp_name: 'Flarg')
      instance = instructable.instances.create
      instance.formatted_location.should == "Private Camp: Flarg (N06)"
    end

    it "renders merchant booth correctly" do
      instructable = create(:instructable, location_type: 'merchant-booth', camp_reason: 'because', camp_address: 'N06', camp_name: 'Flarg')
      instance = instructable.instances.create
      instance.formatted_location.should == "Merchant Booth: Flarg (N06)"
    end

    it "renders pennsic location correctly" do
      instructable = create(:instructable, location_type: 'track')
      instance = instructable.instances.create(location: "Flarg")
      instance.formatted_location.should == "Flarg"
    end

    it "handles blank camp_address" do
      instructable = create(:instructable, location_type: 'private-camp', camp_reason: 'because', camp_name: 'Flarg')
      instance = instructable.instances.create
      instance.formatted_location.should == "Private Camp: Flarg"
    end

    it "handles blank location" do
      instructable = create(:instructable, location_type: 'track')
      instance = instructable.instances.create
      instance.formatted_location.should be_blank
    end
  end
end