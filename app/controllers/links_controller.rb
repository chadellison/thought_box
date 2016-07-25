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

  def update
    link = Link.find(params[:id])
    if params[:status] == "read"
      link.update(read: true)
    else
      link.update(read: false)
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


# respond_to do |format|
#     if @user.save
#       format.html { redirect_to @user, notice: 'User was successfully created.' }
#       format.js   {}
#       format.json { render json: @user, status: :created, location: @user }
#     else
#       format.html { render action: "new" }
#       format.json { render json: @user.errors, status: :unprocessable_entity }
#     end
#   end
