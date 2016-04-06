class ExercisesController < ApplicationController

    def index
      respond_to do |format|
        format.html
        format.json { render json: Exercise.all}
      end
    end

    def create
      @exercise = Exercise.new(day_params)
          if @exercise.save
            render json: @day.to_json, status: :created
          else
            render json: @day.errors, status: :unprocessable_entity
          end
    end

    def show
      @exercise = Exercise.find(params[:id])
      respond_to do |format|
        format.html
        format.json {render json: @exercise.to_json, status: :ok}
      end
    end


    def update
      @exercise = Exercise.find(params[:id])
      if @exercise.update(exercise_params)
        render json: @exercise.to_json, status: :ok
      else
        render json: @exercise.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @exercise = Exercise.find(params[:id])
      @exercise.destroy
      render json: {status: "success"}, status: :ok
    end

    private
    def exercise_params
      params.require(:exercise).permit(:body)
    end

  end





# def index
#   respond_to do |format|
#     format.html
#     format.json { render json: Exercise.all}
#   end
# end
#
# # if (params[:user_id])
# #   @user = User.find(params[:user_id])
# #   @exercises = @user.exercises.all
# # else
# #   @users = User.all
# #   @exercises = @users.map{|s| s.exercises.last}.compact
# # end
#
# # def new
# #   @user = User.find(params[:user_id])
# #   @exercise = @user.exercises.new
# # end
#
# def create
#   @user = User.find(params[:user_id])
#   @exercise = @user.exercises.create!(exercise_params)
#   redirect_to user_exercise_path(@user,@exercise)
# end
#
# def show
#   @user = User.find(params[:user_id])
#   @exercise = @user.exercises.find(params[:id])
# end
#
# def edit
#   @user = User.find(params[:user_id])
#   @exercise = @user.exercises.find(params[:id])
# end
#
# def update
#   @user = User.find(params[:user_id])
#   @exercise = @user.exercises.find(params[:id])
#   @exercise.update(exercise_params)
#   redirect_to user_exercise_path(@user,@exercise)
# end
#
# def destroy
#   @user = User.find(params[:user_id])
#   @exercise = @user.exercises.find(params[:id])
#   @exercise.destroy
#
#   redirect_to user_exercises_path(@user)
# end
#
# private
# def exercise_params
#   params.require(:exercise).permit(:body)
# end
#
# end
