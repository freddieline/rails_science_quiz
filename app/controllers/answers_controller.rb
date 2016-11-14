class AnswersController < ApplicationController

  def show
    @question = @quiz.questions.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end


  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    redirect_to quiz_question_path(params[:quiz_id, :question_id]
  end

  private
    def answer_params
      params.require(:answer).permit(:answer, :correct)
    end

end
