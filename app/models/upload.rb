class Upload < ActiveRecord::Base
  has_attached_file :doc, :path => 'rails_root/non-public/system/:attachment/:id/:basename.:extension', :url => '/:class/:id/:attachment'
  do_not_validate_attachment_file_type :doc
end
