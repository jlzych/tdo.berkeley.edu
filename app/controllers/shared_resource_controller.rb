class SharedResourceController < ApplicationController
  before_filter :authenticate_user!

  def download
    sr = SharedResource.find(params[:id])
    send_file sr.file.path, :type => sr.file.content_type, :disposition => 'inline'
  end
end
