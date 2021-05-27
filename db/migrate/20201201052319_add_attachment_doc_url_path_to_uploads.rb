class AddAttachmentDocUrlPathToUploads < ActiveRecord::Migration[4.2]
  def self.up
    change_table :uploads do |t|
      t.attachment :doc
      t.attachment :url
      t.attachment :path
    end
  end

  def self.down
    remove_attachment :uploads, :doc
    remove_attachment :uploads, :url
    remove_attachment :uploads, :path
  end
end
