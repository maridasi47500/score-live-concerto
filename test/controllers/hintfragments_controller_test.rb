require "test_helper"

class HintfragmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hintfragment = hintfragments(:one)
  end

  test "should get index" do
    get hintfragments_url
    assert_response :success
  end

  test "should get new" do
    get new_hintfragment_url
    assert_response :success
  end

  test "should create hintfragment" do
    assert_difference("Hintfragment.count") do
      post hintfragments_url, params: { hintfragment: { clip_id: @hintfragment.clip_id, comment: @hintfragment.comment, content: @hintfragment.content, key: @hintfragment.key, time: @hintfragment.time, title: @hintfragment.title } }
    end

    assert_redirected_to hintfragment_url(Hintfragment.last)
  end

  test "should show hintfragment" do
    get hintfragment_url(@hintfragment)
    assert_response :success
  end

  test "should get edit" do
    get edit_hintfragment_url(@hintfragment)
    assert_response :success
  end

  test "should update hintfragment" do
    patch hintfragment_url(@hintfragment), params: { hintfragment: { clip_id: @hintfragment.clip_id, comment: @hintfragment.comment, content: @hintfragment.content, key: @hintfragment.key, time: @hintfragment.time, title: @hintfragment.title } }
    assert_redirected_to hintfragment_url(@hintfragment)
  end

  test "should destroy hintfragment" do
    assert_difference("Hintfragment.count", -1) do
      delete hintfragment_url(@hintfragment)
    end

    assert_redirected_to hintfragments_url
  end
end
