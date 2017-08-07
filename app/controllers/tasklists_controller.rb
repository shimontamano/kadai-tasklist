class TasklistsController < ApplicationController
  def create
     @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = 'タスクを作成しました。'
      redirect_to root_url
    else
      @tasks = current_user.tasks.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'タスクの作成に失敗しました。'
      render 'tasks/index'
    end
    
  end

  def destroy
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content)
  end
end
