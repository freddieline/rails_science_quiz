class QuizController < ApplicationController
  

  http_basic_authenticate_with name: "freddie", password: "Cathedral10", only: [:edit, :new, :create, :update, :destroy, :show]

  def do
    @quiz = Quiz.find(params[:id])
  end

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def new
    @quiz = Quiz.new
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end


  def create
    @quiz = Quiz.new(quiz_params)
   
    if @quiz.save
      redirect_to @quiz
    else
      render 'new'
    end
  end

  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update(quiz_params)
      redirect_to @quiz
    end
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy

    redirect_to quiz_index_path
  end


  def submit
    
  end




  private
    def quiz_params
      params.require(:quiz).permit(:title)
    end

end
