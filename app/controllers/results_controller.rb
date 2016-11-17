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

    puts "----------+++++++"
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
    @questions.each do |question|
      @qid = question.id.to_s
      question.answers.each do |answer|
        @aid = answer.id.to_s
        @param = @qid+"-"+@aid
        if params[:"#{@param}"]=="1"
            selected += 1
        end
        if answer.correct==true
          @correctAnswer = answer.id
          if params[:"#{@param}"]=="1"
            score += 1
          end
        end
      end
    end
    puts selected
    @result = @quiz.results.find(params[:id])

    @result.update(score:score)

    if !(selected==@quiz.questions.count)
      puts "<<<<<<"
      puts Result.column_names.include? 'hasSelectedOneAnswer'
      @result.update(hasSelectedOneAnswer: false)
      puts @result.hasSelectedOneAnswer
      @result.save
      render 'edit'


    else
      @result.hasSelectedOneAnswer = true
      @result.save
      redirect_to quiz_result_path(@quiz.id,@result.id)
    end
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
