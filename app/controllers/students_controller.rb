class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
  end
  
  get '/students/:id/activate' do 
    set_student
    if @student.active == false
      @student.active = true 
    else 
      @student.active = false 
    end
    redirect student_path(@student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end