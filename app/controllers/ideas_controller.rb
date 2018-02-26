class IdeasController < ApplicationController
  def index
  end

  def show
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    @idea.user_id = 1
    if @idea.save
      redirect_to ideas_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def idea_params
    params.require(:idea).permit(:title,:description)
  end

end
