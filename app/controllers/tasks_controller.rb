class TasksController < ApplicationController
  
  def index
    @tasks=Task.all
  end
  
  def show
    @task=Task.find(params[:id])
      
  end
  
  def create
    @task=Task.new(task_params)
    if @task.save
      flash[:success] = 'Task が正常に登録されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskが登録されませんでした'
      render :new
    end
  end
  
  def new
    @task=Task.new
  end
  
  def edit
    @task=Task.find(params[:id])
  end
  
  def update
    @task=Task.new(task_params)
    if @task.update
      flash[:success] = 'Task が正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskが更新されませんでした'
      render :new
    end
  end
  
  def destroy
    @task=Task.find(params[:id])
    @task.destroy
    
    flash[:success]='タスクは削除されました'
    redirect_to tasks_url
  end
  
  def task_params
    params.require(:task).permit(:content)
  end
  
  
end
