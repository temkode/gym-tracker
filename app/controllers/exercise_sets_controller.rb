class ExerciseSetsController < ApplicationController
  http_basic_authenticate_with name: ENV["username"], password: ENV["password"], except: [:index]

  def index
    @exercise_sets = ExerciseSet.all.limit(6).order(created_at: :desc)
  end

  def new
    @exercise_set = ExerciseSet.new
  end

  def create
    @exercise_set = ExerciseSet.new(exercise_set_params)

    if @exercise_set.save
      redirect_to root_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @exercise_set = ExerciseSet.find(params[:id])
  end

  def update
    @exercise_set = ExerciseSet.find(params[:id])

    if @exercise_set.update(exercise_set_params)
      redirect_to root_path, status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @exercise_set = ExerciseSet.find(params[:id])
    @exercise_set.destroy
    redirect_to root_path, status: :see_other
  end
  
  private
    def exercise_set_params
      params.require(:exercise_set).permit(:weight_kg, :sets, :reps, :difficulty, :exercise_id, :created_at)
    end
end
