class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :change_grade_student, :enroll_student]
  before_action :authenticate_user!, except: [:dashboard, :course, :profile, :grade]
  before_action :authenticate_student!, only: [:dashboard, :course, :profile, :grade]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def change_grade_student
  end

  def enroll_student
    grade = Grade.find(params[:grade_id])#busco el grado por el id mandado

    grade.courses.each do |c| #por cada cursos encontrado hacemos...
      c.scores.create(student_id: @student.id) #creamos las notas que pertenecen a este curso y pertenecen a este estudiante
    end
    if @student.grades << grade # sitodo lo anterior se ejecuta normalmente enrolamos el grado al estudiante
      redirect_to students_path, notice: 'El Estudiante ha sido inscrito a este grado' #y lo redireccionamos a la vista de estudiantes
    else
      logger.alert 'Cambio de Grado no se realizo exitosamente' #caso contrario agreagamos al registro un error y mostramos un mensaje
      render :change_grade_student #y redireccionamos a la vista de cambio de grado
    end
  end

  def dashboard
      #para mostrar las materias que esta cursando en el grado actual
      @courses = current_student.grades.actual.first.courses unless current_student.grades.actual.first.courses.blank?
      #para mostrar los grados que ya curso
      @grades_old = current_student.grades.where(current: false) unless current_student.grades.where(current: false).blank?
  end

  def course
    #mostrar el curso solicitado con sus respectivas notas
    @course = Course.find(params[:id])
    @scores = @course.scores.find_by student_id: current_student
  end

  def grade
    #obtener los datos del grado- un promedio de las notas-
    @grade = Grade.find(params[:id])
    #promedio
    @ss =0
    @grade.courses.each do |c|
      @ss = @ss + c.scores.where(student_id: current_student).first.score_final if c.scores.any?
    end
    @result = @ss / @grade.courses.count
  end

  def profile
    @student = current_student
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit([:name, :email, :password, :last_name, :genre, :birth, :mother, :father, :phone])
    end
end
