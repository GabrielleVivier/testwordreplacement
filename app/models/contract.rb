class Contract < ActiveRecord::Base
  has_attached_file :text_file

  # validates_attachment_content_type :text_file,
  #   content_type: ['application/pdf']
end
