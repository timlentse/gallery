class TagsController < ApplicationController
  before_action :set_params, only: [:create]
  before_action :set_tags

  def show
    tag_id = params[:id]
    @tag = Tag.find(tag_id)
    @images = @tag.images.order(updated_at: :desc).page(params[:page] || 1)
    # If ajax request, not render layout
    render :show, layout: !request.xhr?
  end

  private

  def set_params
    @tags_params = params.require(:tags).permit(:name, :images)
  end

  def set_tags
    @tags = Tag.joins(:images).where('tags.id is not NULL').group('tags.id')
  end
end
