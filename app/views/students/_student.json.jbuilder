json.extract! student, :id, :name, :email, :password, :group_name, :created_at, :updated_at
json.url student_url(student, format: :json)
