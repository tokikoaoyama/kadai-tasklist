class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    
    def index
        @tasks = Task.all.page(params[:page]).per(3)
    end
    
    def show
    end
    
    def new
        @task = Task.new
    end
    
    def create
        @task = Task.new(task_params)
        
        if @task.save
            flash[:success] = "Task was successfully posted!"
            redirect_to @task
        else 
            flash.now[:danger] = "Failed to post the task :("
            render :new
        end
    end
    
    def edit
    end
    
    def update
        if @task.update(task_params)
            flash[:success] = "Task was successfully updated!"
            redirect_to @task
        else
            flash[:danger] = "Failed to update the task :("
            render :edit
        end
    end
    
    def destroy
        @task.destroy
        
        flash[:success] = "Task was successfully deleted"
        redirect_to tasks_url
    end
    
    private

    def set_task
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:content, :status)
    end
end
