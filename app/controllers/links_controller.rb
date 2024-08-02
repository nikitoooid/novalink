class LinksController < ApplicationController
  before_action :authenticate_user!, except: [:redirect]
  before_action :set_link, only: [:edit, :update, :destroy]

  def index
    @links = Link.all.order('created_at DESC')
  end

  def new
    @link = Link.new
  end

  def create
    @link = current_user.links.build(link_params)
    if @link.save
      redirect_to links_path, notice: 'Посилання успішно створене.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @link.update(link_params)
      redirect_to links_path, notice: 'Посилання успішно оновлене.'
    else
      render :edit
    end
  end

  def destroy
    @link.destroy
    redirect_to links_path, notice: 'Посилання успішно видалене.'
  end

  def redirect
    @link = Link.find_by(slug: params[:slug])
    if @link
      redirect_to @link.url, allow_other_host: true
    else
      redirect_to root_path, notice: 'Посилання не знайдено.'
    end
  end

  private

  def set_link
    @link = current_user.links.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:title, :slug, :url)
  end
end
