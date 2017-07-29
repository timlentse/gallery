class ImagesController < ApplicationController
  before_action :set_params, only: [:create]
  before_action :set_tags

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(@image_params)
    @tag = Tag.find_or_initialize_by(name: params[:tag_name])
    @tag.images << @image
    if @tag.save
      redirect_to tag_path(@tag), notice: '图片上传成功!'
    else
      error_msg = @tag.errors.messages.values.join(';') 
      flash[:notice] = error_msg
      render :new
    end
  end

  def update
    image = Image.find(params[:id])
    if params[:tag_id]
      tag = Tag.find(params[:tag_id])
    else
      tag = Tag.find_or_initialize_by(name: params[:tag_name])
    end
    tag.images << image
    if tag.save
      render json: { code: 0, msg: '修改tag成功!' }
    else
      error_msg = tag.errors.messages.values.join(';') 
      render json: { code: -1, msg: error_msg }
    end
  end

  private

  def set_params
    @image_params = params.require(:image).permit(:url, :title)
  end

  def set_tags
    @tags = Tag.joins(:images).where('tags.id is not NULL').group('tags.id')
  end
end
