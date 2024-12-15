class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]
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
    @task = Task.find_by(id: params[:id])
    if @task
      @task.destroy
      redirect_to tasks_path, notice: 'タスクが削除されました。'
    else
      redirect_to tasks_path, alert: 'タスクが見つかりませんでした。'
    end
  end
  
  private

  def set_task
    @task = Task.find_by(id: params[:id])
    unless @task
      flash[:alert] = "タスクが見つかりませんでした。"
      redirect_to tasks_path
    end
  end

  def task_params
    params.require(:task).permit(:title, :start_date, :end_date, :is_all_day, :memo)
  end
end
