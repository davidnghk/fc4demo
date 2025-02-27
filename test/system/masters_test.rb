require "application_system_test_case"

class MastersTest < ApplicationSystemTestCase
  setup do
    @master = masters(:one)
  end

  test "visiting the index" do
    visit masters_url
    assert_selector "h1", text: "Masters"
  end

  test "creating a Master" do
    visit masters_url
    click_on "New Master"

    fill_in "Code", with: @master.code
    fill_in "Icon", with: @master.icon
    fill_in "Local name", with: @master.local_name
    fill_in "Name", with: @master.name
    fill_in "Param1", with: @master.param1
    fill_in "Parent", with: @master.parent_id
    fill_in "Setting1", with: @master.setting1
    fill_in "Team", with: @master.team_id
    click_on "Create Master"

    assert_text "Master was successfully created"
    click_on "Back"
  end

  test "updating a Master" do
    visit masters_url
    click_on "Edit", match: :first

    fill_in "Code", with: @master.code
    fill_in "Icon", with: @master.icon
    fill_in "Local name", with: @master.local_name
    fill_in "Name", with: @master.name
    fill_in "Param1", with: @master.param1
    fill_in "Parent", with: @master.parent_id
    fill_in "Setting1", with: @master.setting1
    fill_in "Team", with: @master.team_id
    click_on "Update Master"

    assert_text "Master was successfully updated"
    click_on "Back"
  end

  test "destroying a Master" do
    visit masters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Master was successfully destroyed"
  end
end
