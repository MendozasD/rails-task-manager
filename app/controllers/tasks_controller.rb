class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @tasks = Task.new
  end

  def create
    @tasks = Task.new(tasks_params)
    if @tasks.save
      redirect_to tasks_path(@task)
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(tasks_params)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to index_path
  end

  def tasks_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
