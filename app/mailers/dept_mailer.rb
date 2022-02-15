class DeptMailer < ApplicationMailer
    def notify_dept_creation(dept_id)
        @dept = Dept.find(dept_id)
        mail(to: 'navyans2391@gmail.com', subject: "Dept #{@dept.name} has been created!")
        end

end
