class ResultsController < ApplicationController

  def new
    @quiz = Quiz.find(params[:quiz_id])
  end

  def edit
    @quiz = Quiz.find(params[:quiz_id])

  end

  def create

    @quiz = Quiz.find(params[:quiz_id])
    @total = @quiz.questions.count
    @result = @quiz.results.create(name:params[:name])
    @result.hasSelectedOneAnswer = true
    @result.first_attempt = true
    puts @result.hasSelectedOneAnswer
    if @result.save
      puts @result.id
      puts @result.name
      @result.update(total:@total)

      redirect_to edit_quiz_result_path(@quiz, @result.id)
    else
      redirect_to do_quiz_path(params[:quiz_id])
    end
  end

  def update

    @quiz = Quiz.find(params[:quiz_id])
    @questions = Quiz.find(params[:quiz_id]).questions
    score = 0
    selected = 0
    @result = @quiz.results.find(params[:id])
    if (@result.first_attempt==false)
      render 'edit'
    else
      @result.first_attempt = false
      @result.correct_questions.destroy_all
      @result.incorrect_questions.destroy_all

      @questions.each do |question|
        @qid = question.id.to_s
        question.answers.each do |answer|
          @aid = answer.id.to_s
          @param = @qid+"-"+@aid
          if params[:"#{@param}"]=="1"
              selected += 1
          end
          if answer.correct==true    
            if params[:"#{@param}"]=="1"
              @result.correct_questions.create(question:question.question,answer:answer.answer)
              score += 1
            else
              @result.incorrect_questions.create(question:question.question,answer:answer.answer)
            end
          end
        end
      end
      @result.update(score:score)
      if !(selected==@quiz.questions.count)
        @result.update(hasSelectedOneAnswer: false)
        render 'edit'
      else
        @result.hasSelectedOneAnswer = true
        @result.save
        redirect_to quiz_result_path(@quiz.id,@result.id)
      end
    end
  end

  def destroy 
    @quiz = Quiz.find(params[:quiz_id])
    @result = @quiz.results.find(params[:id])
    @result.destroy
    redirect_to quiz_results_path(@quiz)
  end

  def show
    @quiz = Quiz.find(params[:quiz_id])
    @result = @quiz.results.find(params[:id])
  end

  private
    def update_result
      params.require(:require).permit(:hasSelectedOneAnswer)
    end

  private 
    def result_params
      params.require(:result).permit(:name)
    end



end
