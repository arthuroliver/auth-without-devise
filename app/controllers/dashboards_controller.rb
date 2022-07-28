class DashboardsController < ApplicationController
  require 'rest-client'

  before_action :authorize

  def index
    @client_ip = geolocation_request['ip']
    @client_city = geolocation_request['city']
    @client_region = geolocation_request['region']
    @client_country = geolocation_request['country']
  end

  private

  def geolocation_request
    result = RestClient.get('http://ipinfo.io')
    result = JSON.parse result.gsub('=>', ':')
  end
end
