class ExercisesController < ApplicationController
  http_basic_authenticate_with name: ENV["username"], password: ENV["password"], except: [:index]

  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)

    if @exercise.save
      redirect_to action: :index
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])

    if @exercise.update(exercise_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def exercise_params
      params.require(:exercise).permit(:name, :target, :double_weight)
    end
end
