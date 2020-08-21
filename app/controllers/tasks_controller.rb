class TasksController < ApplicationController
  def index
      @tasks = Task.all
  end

  def show
      task_find
  end

  def new
      @task = Task.new
  end

  def create
      @task = Task.new(task_params)

    if @task.save
      flash[:success] = '正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
  end

  def edit
    task_find
  end

  def update
     task_find

    if @task.update(task_params)
      flash[:success] = '正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    task_find
    @task.destroy

    flash[:success] = '正常に削除されました'
    redirect_to tasks_url
  end
  
  private
  
  def task_find
     @task = Task.find(params[:id])
  end 

  def task_params
      params.require(:task).permit(:content ,:status)
  end
end

