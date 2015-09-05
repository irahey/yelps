require 'spec_helper'

describe Restaurant do
  describe '.average_rating' do
    # create(:restaurant)
    let(:restaurant) { create(:restaurant) }
    let(:another_user) { create(:user) }
    context 'no ratings' do
      it "should return 'Unrated' if unrated" do
        expect(restaurant.average_rating).to eq('Unrated')
      end
    end

    context 'a single rating' do
      it 'returns that rating' do
        restaurant.reviews << create(:review)

        expect(restaurant.average_rating).to eq(1)
      end
    end

    context 'multiple ratings' do
      it "should return an average of ratings" do
        restaurant.reviews << create(:review)
        restaurant.reviews << create(:review, ratings: 3, user: another_user)

        expect(restaurant.average_rating.to_i).to eq(2)
      end
    end
  end
end
