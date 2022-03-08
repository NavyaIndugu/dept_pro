#without scaffolding
class DeptsController < ApplicationController
    #before_action :filters_load, only: ['edit','update','show','destroy','download_pdf']
    def index
    @depts = if params[:q] && !params[:q].blank?
    Dept.where(name: params[:q])
    else Dept.all
    end
    end
    
    
    def show
        @dept = Dept.find(params[:id])   
    end

    def new
        @dept = Dept.new
    end

    def create
        @dept = Dept.new(dept_params)
        if @dept.save
            DeptMailer.notify_dept_creation(@dept.id).deliver_now
            redirect_to depts_path
        else
            render :new
        end
    end
   def aboutus
    # redirect_to depts_aboutus_path
   end
   def contact
    # redirect_to depts_contact_path
   end
    def edit
        @dept = Dept.find(params[:id])   
    end

    def update
        @dept = Dept.find(params[:id])
        if @dept.update(dept_params)
        redirect_to depts_path
        else
        render :edit
        end
    end
    def download_pdf
        @dept = Dept.find(params[:id])
        send_file("#{Rails.root}/public/sample.pdf",
        filename: "#{@dept.name}.pdf",
        type: "application/pdf")
        end
    def destroy
        @dept = Dept.find(params[:id])
        @dept.destroy
        redirect_to depts_path
    end
        private
        def dept_params
        params.require(:dept).permit(:name,:students,:staff,:books, :main_image)
        end
        # def filters_load
        #     @dept = Dept.find(params[:id])
        # end    

end
