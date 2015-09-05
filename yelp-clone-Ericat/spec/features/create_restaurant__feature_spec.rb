require 'spec_helper'

describe 'adding a restaurant' do
  before(:each) do
    login
  end

  context 'give a name and a description' do
    it "should display the new restaurant" do
      visit '/restaurants/new'
      fill_in 'Name', with: 'Plenty of Sushi'
      fill_in 'Description', with: 'Om nom nom'
      fill_in 'Postcode', with: 'EC1R 4QE'
      fill_in 'Address', with: '52-54 Exmouth Market, Clerkenwell'
      #future: dropdown
      fill_in 'Tube', with: 'Angel'
      


      click_button 'Add restaurant'

      expect(current_path).to eq '/restaurants'
      expect(page).to have_content('Plenty of Sushi')
    end
  end


  context 'without a name or a description' do
    it "should throw an error" do
      visit '/restaurants/new'

      click_button 'Add restaurant'

      expect(page).to have_content('error')
    end
  end

end