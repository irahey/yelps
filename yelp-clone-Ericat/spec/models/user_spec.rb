require 'spec_helper'

describe User do
  describe '.reviewed?' do
    let(:unreviewed) { create(:restaurant, name: 'Foobar') }
    let(:alex) { create(:user) }
    
    before do
      @reviewed = create(:restaurant)
      create(:review, user: alex, restaurant: @reviewed)
    end

    it 'should return false for restaurants that I have not reviewed' do
      expect(alex.reviewed?(unreviewed)).to be_false
    end

    it 'should return true for restaurants that I have reviewed' do
      expect(alex.reviewed?(@reviewed)).to be_true
    end
  end
end