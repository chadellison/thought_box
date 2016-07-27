class LinksController < ApplicationController
  def index
    if current_user
      @links = current_user.links
      @link = Link.new
    else
      redirect_to authentication_path
    end
  end

  def create
    link = current_user.links.create(link_params)
    if link.save

    else
      flash[:error] = "The Url must be valid"
    end
    redirect_to root_path
  end

  def update
    link = Link.find(params[:id])
    if params[:status]
      params[:status] == "read" ? link.update(read: true) : link.update(read: false)
    else
      link.update(link_params)
      flash[:error] = "The Url must be valid" if !link.save
    end
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {}
    end
  end

  private

    def link_params
      params.require(:link).permit(:title, :url)
    end
end
