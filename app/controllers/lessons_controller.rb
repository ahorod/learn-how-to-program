class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all.order(:number)
    render :index
  end

  def show
    @lesson = Lesson.find(params[:id])
    @next_lesson = @lesson.next
    @previous_lesson = @lesson.previous
    render :show
  end

  def new
    @section = Section.find(params[:section_id])
    @lesson = @section.lessons.new
    render :new
  end

  def create
    @section = Section.find(params[:section_id])
    @lesson = @section.lessons.new(lesson_params)
    if @lesson.save
      redirect_to  section_path(@section)
    else
      render :new
    end
  end

  def edit
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
    render :edit
  end

  def update
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
      if @lesson.update(lesson_params)
        redirect_to section_path(@section)
      else
        render :edit
      end
  end

  def destroy
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to section_path(@section)
  end

  private
    def lesson_params
      params.require(:lesson).permit(:name, :content, :number, :term)
    end
end
