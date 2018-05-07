class Admin::BackupsController < ApplicationController
  def index
    @backups = Backup.new.list_backup_files
  end

  def send_a_file(datafilepath, filename, filetype)
    File.open(datafilepath, 'r') do |f|
      send_data f.read.force_encoding('BINARY'),
        :type => filetype,
      :disposition => "attachment",
      :filename => filename
    end
  end
  
  # download
  def show
    basename = params[:id].split('/').last + '.zip'  # ensure no directory
    send_a_file Backup.new.backup_path.join(basename), basename, "application/octet-stream"
#    send_file Backup.new.backup_path.join(basename)
  end

  # create new one
  def new
    Backup.new.backup
    redirect_to admin_backups_path, notice: 'New backup file created.'
  end
end
