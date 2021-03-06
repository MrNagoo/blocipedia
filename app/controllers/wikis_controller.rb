class WikisController < ApplicationController

  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.user = current_user
    if @wiki.save
      flash[:notice] = "Wiki was saved succesfully"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving you wiki"
      render :new
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    @wiki.update_attributes(wiki_params)

    if @wiki.save
      flash[:notice] = "Wiki was updated"
      redirect_to @wiki
    else
      flash.now[:alert] = "Error saving wiki"
      render :new
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.destroy
      flash[:notice] = "#{@wiki.title} was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
  end
