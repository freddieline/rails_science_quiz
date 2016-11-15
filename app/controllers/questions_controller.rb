class QuestionsController < ApplicationController

 

  def show
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.find(params[:id])
    
  end


  def edit
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.find(params[:id])
    
  end

  def update
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.find(params[:id])

    if @question.update(question_params)
      redirect_to quiz_path(@quiz)
    end
  end

  def destroy
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.find(params[:id])
    @question.destroy

    redirect_to quiz_path(@quiz)
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.create(question_params)
    redirect_to quiz_path(@quiz)
  end

  private
    def question_params
      params.require(:question).permit(:question)
    end


end
