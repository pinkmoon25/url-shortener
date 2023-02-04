class LinksController < ApplicationController
  before_action do
    unless Current.user
      flash[:alert] = "Please login for access"
      redirect_to root_path
    end
  end

  def index
    @links = Current.user.links.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user = Current.user
    if @link.alias.empty?
      @link.short_url = @link.generate_mini_url
    elsif Link.exists?(alias: "#{@link.alias}")
      flash[:alert] = "alias is taken please try another"
      redirect_to new_link_path
      return
    else
      @link.short_url = "http://localhost:3000/#{@link.alias}"
    end      
    if @link.save
      flash[:notice] = "You got it!"
      redirect_to links_path
    else
      render :new, status: 422
    end
  end

  def show
    link = Link.find(params[:id])
    redirect_to link.long_url, allow_other_host: true
  end

  def visit_link
    link = Link.find_by(short_url: "http://localhost:3000/#{params[:uuid]}")
    redirect_to link.long_url, allow_other_host: true
  end

  private

  def link_params
    params.require(:link).permit(:long_url, :alias)
  end
end
