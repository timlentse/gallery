class TagsController < ApplicationController
  before_action :set_tags

  def show
    tag_id = params[:id]
    @tag = Tag.find(tag_id)
    @images = @tag.images.order(updated_at: :desc).page(params[:page] || 1)
    # If ajax request, not render layout
    if request.xhr?
      render 'images/partial', layout: false
    else
      render 'images/index'
    end
  end

  private

  def set_tags
    @tags = Tag.joins(:images).where('tags.id is not NULL').group('tags.id')
  end
end
