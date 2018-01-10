class Api::TestController < ApiController

  def index
    render json: StanhomeProduct.all
  end

end