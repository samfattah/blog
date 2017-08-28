class PagesController < ApplicationController
  
  # Responisble for showing all pages
  def index
    @pages= Page.all
  end

  # Responsible for showing a specific page
  def show
    @page = Page.find(params[:id])
    # render :show - app/views/pages.show.html.erb
  end

  # Responsible for showing a form to edit an existing page
  def edit
    @page = Page.find(params[:id])
    # render :edit - app/views/pages/
  end

  # Responsible for updating the values of a pre existing record
  def update
    @page = Page.find(params[:id])
    if @page.update(page_params)
      # Success
      redirect_to page_path(@page)
    else
      # Fail
      render :edit
    end
  end

  # Responsible for showing a form to create a new page
  def new
    @page = Page.new
    # render :new app/views/pages/new.html.erb
  end

  # Responsible for saving a new record in our database
  def create
    # strong params
    page = Page.create(page_params)
    # executes the sql to try to save the new page in the database
    if page.save
      #success - new record in the database
      redirect_to page_path(page)
    else
      # fail - failed to ececute the sql fro some reason
      render :new
    end
  end

  def destroy
    page = Page.find(params[:id])
    page.destroy
    redirect_to pages_path
  end

  private
    def page_params
      params.require(:page).permit(:title, :author, :body, :private)
    end

end
