class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create!(tasks_params)
    redirect_to task_path(@task)
  end

   def edit
    @task = Task.find(params[:id])
    @task.save

  end

  def update
    @task = Task.find(params[:id])
    @task.update(tasks_params)
    redirect_to task_path(@task)
  end

  def destroy
   @task = Task.find(params[:id])
    @restaurant.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to restaurants_path
  end

   private

  def tasks_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:task).permit(:title, :description, :completed)
  end
end


