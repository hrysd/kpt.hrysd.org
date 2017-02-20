class LetsencryptController < ApplicationController
  def show
    unless params[:id] == request_key
      head :not_found

      return
    end

    render plain: response_key
  end

  private

  def request_key
    configuration.lets_encrypt_request_key
  end

  def response_key
    configuration.lets_encrypt_response_key
  end

  def configuration
    @configuration ||= Rails.application.config.x
  end
end
