class LinksController < ApplicationController
  def index
    if current_user
      @links = Link.all
      @link = Link.new
    else
      redirect_to authentication_path
    end
  end

  def create
    link = Link.create(link_params)
    if link.save
    else
      flash[:error] = "The Url must be valid"
    end
    redirect_to root_path
  end

  private

    def link_params
      params.require(:link).permit(:title, :url)
    end
end
