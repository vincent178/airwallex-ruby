require 'faraday'

class Airwallex
  def initialize(environment, client_id, api_key)
    url = if environment == 'demo'
            'https://api-demo.airwallex.com'
          else
            'https://www.airwallex.com'
          end

    @client_id = client_id
    @api_key = api_key

    @conn = Faraday.new(url) do |f|
      f.request :json
      f.response :json
    end
  end

  def login()
    headers = {
      'x-api-key' => @api_key,
      'x-client-id' => @client_id
    }

    resp = @conn.post('/api/v1/authentication/login', nil, headers)
    resp.body['token']
  end

  def get_lockfx_quote(buy_currency, sell_currency, buy_amount, conversion_date, validity = 'MIN_15')
    body = {
      buy_currency: buy_currency,
      sell_currency: sell_currency,
      buy_amount: buy_amount,
      conversion_date: conversion_date,
      validity: validity 
    }

    @conn.post('/api/v1/lockfx/create', body, auth_header)
  end

  def create_conversion(quote_id, buy_currency, sell_currency, buy_amount, conversion_date, reason)
    body = {
      "request_id" => (Time.now.to_i + rand(1000)).to_s,
      "quote_id" => quote_id,
      "buy_amount" => buy_amount,
      "buy_currency" => buy_currency,
      "sell_currency" => sell_currency,
      "term_agreement" => true,
      "conversion_date" => conversion_date,
      "reason" => reason
    }.to_json

    @conn.post('/api/v1/conversions/create', body, auth_header) 
  end

  private

  def get_token
    @token ||= login
  end

  def auth_header
    {
      'Authorization' => "Bearer #{get_token}",
      'Content-Type' => 'application/json'
    }
  end
end
 
