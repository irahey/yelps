require 'spec_helper'

describe 'adding a restaurant' do
  context 'give a name and a description' do
    it "should display the new restaurant" do
      visit '/restaurants/new'
      fill_in 'Name', with: 'Plenty of Sushi'
      fill_in 'Description', with: 'Om nom nom'

      click_button 'Add restaurant'

      expect(current_path).to eq '/restaurants'
      expect(page).to have_content('Plenty of Sushi')
    end
  end

end