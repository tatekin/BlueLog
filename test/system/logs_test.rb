require "application_system_test_case"

class LogsTest < ApplicationSystemTestCase
  setup do
    @log = logs(:one)
  end

  test "visiting the index" do
    visit logs_url
    assert_selector "h1", text: "Logs"
  end

  test "creating a Log" do
    visit logs_url
    click_on "New Log"

    fill_in "Ave", with: @log.Ave
    fill_in "Cl", with: @log.Cl
    fill_in "Dt", with: @log.Dt
    fill_in "En", with: @log.En
    fill_in "Ex", with: @log.Ex
    fill_in "Max", with: @log.Max
    fill_in "Temp", with: @log.Temp
    fill_in "Date", with: @log.date
    fill_in "Fish", with: @log.fish
    fill_in "Image", with: @log.image
    fill_in "Place", with: @log.place
    fill_in "Point", with: @log.point
    click_on "ログ作成"

    assert_text "Log was successfully created"
    click_on "Back"
  end

  test "updating a Log" do
    visit logs_url
    click_on "Edit", match: :first

    fill_in "Ave", with: @log.Ave
    fill_in "Cl", with: @log.Cl
    fill_in "Dt", with: @log.Dt
    fill_in "En", with: @log.En
    fill_in "Ex", with: @log.Ex
    fill_in "Max", with: @log.Max
    fill_in "Temp", with: @log.Temp
    fill_in "Date", with: @log.date
    fill_in "Fish", with: @log.fish
    fill_in "Image", with: @log.image
    fill_in "Place", with: @log.place
    fill_in "Point", with: @log.point
    click_on "ログ編集"

    assert_text "Log was successfully updated"
    click_on "Back"
  end

  test "destroying a Log" do
    visit logs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Log was successfully destroyed"
  end
end
