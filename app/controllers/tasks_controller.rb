class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "スケジュールを登録しました。"
      redirect_to tasks_path
    else
      flash.now[:alert] = "スケジュールの登録に失敗しました。"
      render "new"
  end
end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "スケジュールを更新しました。"
      redirect_to tasks_path
    else
      flash.now[:alert] = "スケジュールの更新に失敗しました。"
      render "edit"
    end
  end

  def destroy
    if @task.destroy
      flash[:notice] = "スケジュールを削除しました。"
    else
      flash[:alert] = "スケジュールの削除に失敗しました。"
    end
    redirect_to tasks_path
  end
  
  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :start_date, :end_date, :is_all_day, :memo)
  end
end
