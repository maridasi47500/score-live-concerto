require "application_system_test_case"

class HintfragmentsTest < ApplicationSystemTestCase
  setup do
    @hintfragment = hintfragments(:one)
  end

  test "visiting the index" do
    visit hintfragments_url
    assert_selector "h1", text: "Hintfragments"
  end

  test "should create hintfragment" do
    visit hintfragments_url
    click_on "New hintfragment"

    fill_in "Clip", with: @hintfragment.clip_id
    fill_in "Comment", with: @hintfragment.comment
    fill_in "Content", with: @hintfragment.content
    fill_in "Key", with: @hintfragment.key
    fill_in "Time", with: @hintfragment.time
    fill_in "Title", with: @hintfragment.title
    click_on "Create Hintfragment"

    assert_text "Hintfragment was successfully created"
    click_on "Back"
  end

  test "should update Hintfragment" do
    visit hintfragment_url(@hintfragment)
    click_on "Edit this hintfragment", match: :first

    fill_in "Clip", with: @hintfragment.clip_id
    fill_in "Comment", with: @hintfragment.comment
    fill_in "Content", with: @hintfragment.content
    fill_in "Key", with: @hintfragment.key
    fill_in "Time", with: @hintfragment.time
    fill_in "Title", with: @hintfragment.title
    click_on "Update Hintfragment"

    assert_text "Hintfragment was successfully updated"
    click_on "Back"
  end

  test "should destroy Hintfragment" do
    visit hintfragment_url(@hintfragment)
    click_on "Destroy this hintfragment", match: :first

    assert_text "Hintfragment was successfully destroyed"
  end
end
