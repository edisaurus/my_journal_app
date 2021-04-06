class CategoriesController < ApplicationController
    before_action :set_category, only: %i[ show edit update destroy ]

    def index
        @categories = current_user.categories
    end

    def show
    end

    def new
        @category = current_user.categories.build
    end

    def edit
    end

    def create
        @category = current_user.categories.build(category_params)
        respond_to do |format|
            if @category.save
                format.html { redirect_to categories_url, notice: "Category created!" }
                format.json { render :show, status: :created, location: @category }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @category.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @category.update(category_params)
                format.html { redirect_to categories_url, notice: "Category updated!" }
                format.json { render :show, status: :ok, location: @category }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @category.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @category.destroy
        respond_to do |format|
            format.html { redirect_to categories_url, notice: "Category deleted!" }
            format.json { head :no_content }
        end
    end

    private

    def set_category
        @category = current_user.categories.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:name, :description, :date_created, :user_id)
    end

end
