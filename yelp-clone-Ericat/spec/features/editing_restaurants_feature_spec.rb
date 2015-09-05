require 'spec_helper'

describe "Editing restaurants" do
  
  before(:each) do
    login
    create(:restaurant)
    visit('/restaurants')
  end

  it 'should be able to edit a record' do
    click_link('Edit')
    fill_in 'Description', with: 'The second best sushi in town'
    click_button('Update')
    expect(page).to have_content('The second best sushi in town')
  end

  it "should be able to delete a record" do
    click_link('Delete')
    expect(page).not_to have_content('The second best sushi in town')
  end
end