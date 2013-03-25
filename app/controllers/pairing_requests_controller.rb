class PairingRequestsController < ApplicationController
  def create
    PairingRequest.request(pairing_request_params)
    redirect_to root_url
  end

  private

  def pairing_request_params
    params.require(:pairing_request).permit(:email)
  end
end
