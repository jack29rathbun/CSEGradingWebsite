module SessionsHelper
    # Logs the student in
    def student_log_in(student)
        if admin_logged_in?
            log_out
        end
        session[:student_id] = student.id
    end
    # Logs the admin in
    def admin_log_in(admin)
        if student_logged_in?
            log_out
        end
        
        session[:admin_id] = admin.id
    end

    # return current logged in student
    def current_student
        if session[:student_id]
            @current_student ||= Student.find_by(id: session[:student_id])
        end
    end

    # return current logged in admin
    def current_admin
        if session[:admin_id]
            @current_admin ||= Admin.find_by(id: session[:admin_id])
        end
    end

    # return true if a student is logged in
    def student_logged_in?
        !current_student.nil?
    end

    # return true if an admin is logged in
    def admin_logged_in?
        !current_admin.nil?
    end

    def log_out
        if student_logged_in?
            session.delete(:student_id)
            @current_student = nil
        elsif admin_logged_in?
            session.delete(:admin_id)
            @current_admin = nil
        end
    end

end
