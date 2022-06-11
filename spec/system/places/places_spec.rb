# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'places', type: :system, js: true do
  it 'loads landing page' do
    visit places_path
    expect(page).to have_content('AllTrails at Lunch')
  end

  it 'can perform restaurant search' do
    visit places_path
    within('.navbar') do
      fill_in('search-input', with: 'Thai')
      click_on 'Search'
    end
    expect(find_all('.place-item').size).to be > 0
  end

  it 'can add a favorite place' do
    expect(FavoritePlace.count).to eq(0)
    visit places_path
    within('.navbar') do
      fill_in('search-input', with: 'Thai')
      click_on 'Search'
    end
    find_all('.fa-heart').first.click
    visit places_path
    expect(FavoritePlace.count).to eq(1)
  end
end
