class StudentsController < ApplicationController
  def new
    @student = Student.new
  end
  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to(new_student_path, :notice => "Student was created successfully")
    else
      render "new"
    end
  end

  def index
    @students = Student.all
  end


  private

  def student_params
    params.require(:student).permit!
  end

end
