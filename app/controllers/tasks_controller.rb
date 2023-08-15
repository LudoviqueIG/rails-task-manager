class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def new
    @tasks = Task.new
  end


  def create
    task = Task.new(tasks_params)
    task.save

    redirect_to task_path(task)
  end

  def edit
    @tasks = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update(tasks_params)
    redirect_to task_path(task)
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy

    redirect_to tasks_path
  end


  private

  def tasks_params
    params.require(:task).permit(:title, :details,)
  end
end
