class AnswersController < ApplicationController

  http_basic_authenticate_with name: "freddie", password: "Cathedral10"
  
  def index
    @quiz = Quiz.find(params[:quiz_id])
  end

  def do
    @quiz = Quiz.find(params[:quiz_id])
  end


  def show
    @question = @quiz.questions.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    redirect_to controller: 'questions', action: 'show', quiz_id: @quiz.id, id: @question.id
  end

  def destroy
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to controller: 'questions', action: 'show', quiz_id: @quiz.id, id: @question.id
  end


  private 
    def submit_parameters
      params.require(:answer).permit(:selected)
    end


  private
    def answer_params
      params.require(:answer).permit(:answer, :correct)
    end

end
