class TagsController < ApplicationController

  def index
    @tags = Tag.all

    respond_to do |format|
      format.html
      format.json { render json: @tags.where(:name => /#{params[:q]}/) }
    end
  end

  def show
    @tag = Tag.find(params[:id])
  end


  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
