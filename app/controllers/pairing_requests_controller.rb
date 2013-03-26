class PairingRequestsController < ApplicationController
  def create
    @pairing_request = PairingRequest.request(pairing_request_params)
    if @pairing_request.valid?
      redirect_to root_url, notice: "Thanks!  We'll get back to you soon."
    else
      render template: "welcome/index"
    end
  end

  private

  def pairing_request_params
    params.require(:pairing_request).permit(:email)
  end
end
