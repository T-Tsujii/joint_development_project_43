class TasksController < ApplicationController

    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
    end

    def create
        Task.create(task_params)
        redirect_to task_params
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        task = Task.find(params[:id])
        task.update(task_params)
        redirect_to tasks_path
    end

    def show
        @tasks = Task.find(params[:id])
    end

    private
    def task_params
        params.require(:task).permit(:title, :content)
    end
end
