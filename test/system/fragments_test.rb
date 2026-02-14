require "application_system_test_case"

class FragmentsTest < ApplicationSystemTestCase
  setup do
    @fragment = fragments(:one)
  end

  test "visiting the index" do
    visit fragments_url
    assert_selector "h1", text: "Fragments"
  end

  test "should create fragment" do
    visit fragments_url
    click_on "New fragment"

    fill_in "Composer", with: @fragment.composer_id
    fill_in "Content", with: @fragment.content
    fill_in "Key", with: @fragment.key
    fill_in "Time", with: @fragment.time
    fill_in "Title", with: @fragment.title
    click_on "Create Fragment"

    assert_text "Fragment was successfully created"
    click_on "Back"
  end

  test "should update Fragment" do
    visit fragment_url(@fragment)
    click_on "Edit this fragment", match: :first

    fill_in "Composer", with: @fragment.composer_id
    fill_in "Content", with: @fragment.content
    fill_in "Key", with: @fragment.key
    fill_in "Time", with: @fragment.time
    fill_in "Title", with: @fragment.title
    click_on "Update Fragment"

    assert_text "Fragment was successfully updated"
    click_on "Back"
  end

  test "should destroy Fragment" do
    visit fragment_url(@fragment)
    click_on "Destroy this fragment", match: :first

    assert_text "Fragment was successfully destroyed"
  end
end
