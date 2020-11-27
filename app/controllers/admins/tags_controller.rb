class Admins::TagsController < ApplicationController
before_action :authenticate_admin!

  def index
	@tags = Tag.all
	@tag = Tag.new
  end

  def edit
  	@tag = Tag.find(params[:id])
  end

  def update
  	@tag = Tag.find(params[:id])
    @tag.update(tag_params)
    redirect_to admins_tags_path
  end

private
  def tag_params
    params.require(:tag).permit(:name, :is_effective)
  end
end
