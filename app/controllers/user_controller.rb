class UserController < ApplicationController

  def index
    user_file
  end

  def user_file

    @user = User.find(1)

    respond_to do |format|
      format.html
      format.docx do
        # Initialize DocxReplace with your template
        doc = DocxReplace::Doc.new("#{Rails.root}/lib/docx_templates/firstname.docx", "#{Rails.root}/tmp")

        puts 'TEST'
        puts doc.matches("FIRST_NAME")
        puts 'TEST'

        # Replace some variables. $var$ convention is used here, but not required.
        doc.replace("FIRST_NAME", @user.first_name)

        # Write the document back to a temporary file
        tmp_file = Tempfile.new('word_tempate', "#{Rails.root}/tmp")
        doc.commit(tmp_file.path)

        # Respond to the request by sending the temp file
        send_file tmp_file.path, filename: "user_#{@user.id}_report.docx", disposition: 'attachment'
      end
    end

  end

end
