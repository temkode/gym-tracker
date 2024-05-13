require "test_helper"

class ExercisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exercise = exercises(:one)
    @exercise_set = @exercise.exercise_sets.create({weight_kg: 10, reps: 10, sets: 4, difficulty: 1})
  end

  test "should get index" do
    get exercises_url
    assert_response :success
  end

  test "should get new" do
    get new_exercise_url
    assert_response :success
  end

  test "should create exercise" do
    assert_difference('Exercise.count') do
      post exercises_url, params: { exercise: { name: @exercise.name, target: @exercise.target, double_weight: @exercise.double_weight } }
    end

    assert_redirected_to exercises_url
  end

  test "should show exercise" do
    get exercise_url(@exercise)
    assert_response :success
  end

  test "should get edit" do
    get edit_exercise_url(@exercise)
    assert_response :success
  end

  test "should update exercise" do
    patch exercise_url(@exercise), params: { exercise: { name: @exercise.name, target: @exercise.target, double_weight: @exercise.double_weight } }
    assert_redirected_to root_url
  end

  test "should destroy exercise" do
    assert_difference('Exercise.count', -1) do
      delete exercise_url(@exercise)
    end

    assert_redirected_to root_url
  end
end
