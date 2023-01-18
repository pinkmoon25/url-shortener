class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    link = Link.new(link_params)
    if link.alias.empty?
      link.short_url = link.generate_mini_url
    elsif Link.exists?(alias: "#{link.alias}")
      flash[:alert] = "alias is taken please try another"
      redirect_to root_path
      return
    else
      link.short_url = "https://mini/#{link.alias}"
    end      
    if link.save
      flash[:notice] = "You got it!"
      redirect_to links_path
    else
      flash[:alert] = link.errors.full_messages
      render :new
    end
  end

  def show
  end

  private

  def link_params
    params.require(:link).permit(:long_url, :alias)
  end
end
