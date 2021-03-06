class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
    render :index
  end

  def new
    @library = Library.new
    render :new
  end

  def create
    @library = Library.create(library_params)
    redirect_to libraries_path  # very light on the error handling, for now!
  end

  def show
    @library = Library.find_by_id(params[:id])
    render :show
  end

   private

  def library_params
    params.require(:library).permit(:name, :floor_count, :floor_area)
  end
end
