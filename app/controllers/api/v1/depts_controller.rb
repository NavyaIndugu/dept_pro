class Api::V1::DeptsController < ActionController::API
    def index
    depts = Dept.all
    render json: {message: 'OK', depts: depts.as_json(only: [:name, :students, :staff, :books,:created_at])}.to_json, status: 200
    end
    def show
    dept = Dept.find(params[:id])
    if dept
    render json: {message: 'OK', dept: dept}.to_json, status: 200
    else
    render json: {message: 'Error', error: 'Dept not found with the given id'}.to_json, status: 404
    end
    rescue => e
    render json: {message: 'Error', error: e.message }.to_json, status: 500
    end
    def create
    dept = Dept.new(dept_params)
    if dept.save
    render json: {message: 'OK', dept: dept}.to_json, status: :created
    else
    render json: {message: 'Error', error: 'dept couldnt create'}.to_json, status: 404
    end
    end
    private
    def dept_params
    params.require(:dept).permit(:name, :students, :staff, :books)
    end
    end