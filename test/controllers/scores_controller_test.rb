require 'test_helper'

class ScoresControllerTest < ActionController::TestCase
  setup do
    @score = scores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create score" do
    assert_difference('Score.count') do
      post :create, score: { course_id: @score.course_id, score_final: @score.score_final, score_four: @score.score_four, score_one: @score.score_one, score_test: @score.score_test, score_three: @score.score_three, score_two: @score.score_two, student_id: @score.student_id }
    end

    assert_redirected_to score_path(assigns(:score))
  end

  test "should show score" do
    get :show, id: @score
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @score
    assert_response :success
  end

  test "should update score" do
    patch :update, id: @score, score: { course_id: @score.course_id, score_final: @score.score_final, score_four: @score.score_four, score_one: @score.score_one, score_test: @score.score_test, score_three: @score.score_three, score_two: @score.score_two, student_id: @score.student_id }
    assert_redirected_to score_path(assigns(:score))
  end

  test "should destroy score" do
    assert_difference('Score.count', -1) do
      delete :destroy, id: @score
    end

    assert_redirected_to scores_path
  end
end
