class WelcomeController < ApplicationController
  def index
    @pairing_request = PairingRequest.new
  end
end
