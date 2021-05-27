require 'spreadsheet'

module DataReader
  def read_data(path_to_file)
    begin
      Spreadsheet.client_encoding = 'UTF-8'
      book = Spreadsheet.open path_to_file
      sheet = book.worksheet 0
      sheet.each 1 do |row|
        if !Group.find_by(name: row[2])
          Group.create!(name: row[2])
        end
        Student.create!(name: row[0], email: row[1], group_name: row[2], password: row[3], group_id: Group.find_by(name: row[2])&.id)
      end
    rescue Exception => e
      puts e
    end
  end
end
