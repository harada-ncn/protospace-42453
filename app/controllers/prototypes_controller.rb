class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :destroy]

  def index 
    @prototypes = Prototype.all
    @prototype=Prototype.new
  end

  def show
    @prototype= Prototype.find(params[:id])
    @comments = Prototype.find(params[:id]).comments
    @comment = Prototype.find(params[:id]).comments.new
  end

  def edit
    
    unless user_signed_in? && current_user.id == params[:use_id]
      redirect_to action: :index
    end
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(params[:id])
    else
      redirect_to edit_prototype_path
    end
  end

  def new
    @prototype=Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    prototype=Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
