class TasksController < ApplicationController
    before_action :get_category
    before_action :set_task, only: %i[ show edit update destroy ]

    def index
        @tasks = @category.tasks
    end

    def show
    end

    def new
        @task = @category.tasks.build
    end

    def edit
    end

    def create
        @task = @category.tasks.build(task_params)
        respond_to do |format|
            if @task.save
                format.html { redirect_to category_tasks_path(@category), notice: "Task created!" }
                format.json { render :show, status: :created, location: @task }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @task.errors, status: :unprocessable_entity }
            end
        end
    end    

    def update
        respond_to do |format|
            if @task.update(task_params)
                format.html { redirect_to category_task_path(@category), notice: "Task updated!" }
                format.json { render :show, status: :ok, location: @task }
            else
                format.html { render :edit, status: :ok, location: :unprocessable_entity }
                format.json { render json: @task.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @task.destroy
        respond_to do |format|
                format.html { redirect_to category_tasks_path(@category), notice: "Task deleted!" }
                format.json { head :no_content }
        end
    end

    private

        def get_category
            @category = current_user.categories.find(params[:category_id])
        end

        def set_task
            @task = @category.tasks.find(params[:id])
        end

        def task_params
            params.require(:task).permit(:name, :description, :start_date, :end_date, :category_id)
        end
end
