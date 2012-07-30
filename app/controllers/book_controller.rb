class BookController < ApplicationController
  before_filter :authenticate_user!

  def show
    @id = params[:id]
  end

  def chapter
    id = params[:id]
    # render "book/eBook/dynamic_flavors_test", :layout => false
    send_file "#{Rails.root}/app/views/book/pdfs/TDOChapter#{id}.pdf", :type => 'application/pdf', :disposition => 'inline'
  end
end
