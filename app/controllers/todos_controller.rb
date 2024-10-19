class TodosController < ApplicationController
    def index
      @todos = Todo.all
    end
  
    def new
      @todo = Todo.new
      @categories = Category.all
    end
  
    def create
      @todo = Todo.new(todo_params)
      if @todo.save
        redirect_to category_todos_path(@todo.category)
      else
        render :new
      end
    end
  
    def edit
      @todo = Todo.find(params[:id])
      @categories = Category.all
    end
  
    def update
      @todo = Todo.find(params[:id])
      if @todo.update(todo_params)
        redirect_to category_todos_path(@todo.category)
      else
        render :edit
      end
    end
  
    def destroy
      @todo = Todo.find(params[:id])
      @todo.destroy
      redirect_to category_todos_path(@todo.category)
    end
  
    private
  
    def todo_params
      params.require(:todo).permit(:name, :category_id, :completed)
    end
  end