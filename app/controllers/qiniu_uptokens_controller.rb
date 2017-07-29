class QiniuUptokensController < ApplicationController
  # create uptoken for qiniu
  def create
    put_policy = Qiniu::Auth::PutPolicy.new(Settings.qiniu.bucket)
    token = Qiniu::Auth.generate_uptoken(put_policy)
    render json: { uptoken: token }
  end
end
