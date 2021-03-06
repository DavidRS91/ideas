class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_idea, except: [:index, :create, :new]
  before_action :authorize_user!, only: [:edit, :update, :destroy]
  def index
    @ideas = Idea.all
  end

  def show
    @reviews = @idea.reviews
    @review = Review.new
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    @idea.user = current_user
    if @idea.save
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @idea.update idea_params
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path
  end


  private

  def idea_params
    params.require(:idea).permit(:title,:description)
  end

  def find_idea
    @idea = Idea.find params[:id]
  end

  def authorize_user!
  unless can?(:manage, @idea)
    flash[:alert] = 'Access Denied!'
    redirect_to idea_path(@idea)
  end
end

end
