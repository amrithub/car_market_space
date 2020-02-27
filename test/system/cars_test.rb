require "application_system_test_case"

class CarsTest < ApplicationSystemTestCase
  setup do
    @car = cars(:one)
  end

  test "visiting the index" do
    visit cars_url
    assert_selector "h1", text: "Cars"
  end

  test "creating a Car" do
    visit cars_url
    click_on "New Car"

    fill_in "Air conditioning", with: @car.air_conditioning
    fill_in "Body type", with: @car.body_type
    fill_in "Colour", with: @car.colour
    fill_in "Date posted", with: @car.date_posted
    fill_in "Kilometres", with: @car.kilometres
    fill_in "Last edited", with: @car.last_edited
    fill_in "Make", with: @car.make
    fill_in "Model", with: @car.model
    fill_in "Transmission", with: @car.transmission
    fill_in "Year manufactured", with: @car.year_manufactured
    click_on "Create Car"

    assert_text "Car was successfully created"
    click_on "Back"
  end

  test "updating a Car" do
    visit cars_url
    click_on "Edit", match: :first

    fill_in "Air conditioning", with: @car.air_conditioning
    fill_in "Body type", with: @car.body_type
    fill_in "Colour", with: @car.colour
    fill_in "Date posted", with: @car.date_posted
    fill_in "Kilometres", with: @car.kilometres
    fill_in "Last edited", with: @car.last_edited
    fill_in "Make", with: @car.make
    fill_in "Model", with: @car.model
    fill_in "Transmission", with: @car.transmission
    fill_in "Year manufactured", with: @car.year_manufactured
    click_on "Update Car"

    assert_text "Car was successfully updated"
    click_on "Back"
  end

  test "destroying a Car" do
    visit cars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Car was successfully destroyed"
  end
end
