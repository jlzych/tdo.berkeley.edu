class BookController < ApplicationController
  before_filter :authenticate_user!

  def index
    @shared_resources = SharedResource.all # TODO: Paginate?
  end

  def show
    @id = params[:id]
  end

  def chapter
    id = params[:id]
    # render "book/eBook/dynamic_flavors_test", :layout => false
    send_file "#{Rails.root}/app/views/book/pdfs/TDOChapter#{id}.pdf", :type => 'application/pdf', :disposition => 'inline'
  end

  def tweets
    page = params[:page] || 1
    rpp = params[:rpp] || 10
    @tweets = Twitter.search('#tdofix OR #tdoexample -rt', :page => page, :rpp => rpp).results
    render :json => @tweets
  end
end
