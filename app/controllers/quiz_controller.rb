class QuizController < ApplicationController
    
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
    puts "update from answers"

    Answer.update(params[:answer].keys, params[:answer].values)
    @answers = Quiz.find(params[:quiz_id]).answers

    @answers.update_all()
    redirect_to quiz_answers_path
  end




  private
    def quiz_params
      params.require(:quiz).permit(:title)
    end

end
