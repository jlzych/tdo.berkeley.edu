class BookController < ApplicationController
  before_filter :authenticate_user!

  def show
    @id = params[:id]
  end

  def chapter
    id = params[:id]
    render "book/eBook/dynamic_flavors_test", :layout => false
  end
end
