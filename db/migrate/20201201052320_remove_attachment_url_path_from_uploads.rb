class RemoveAttachmentUrlPathFromUploads < ActiveRecord::Migration[4.2]
  def self.up
    remove_attachment :uploads, :url
    remove_attachment :uploads, :path
  end

  def self.down
    add_attachment :uploads, :url
    add_attachment :uploads, :path
  end
end
