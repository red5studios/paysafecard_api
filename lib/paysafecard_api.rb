require 'soap/wsdlDriver'

module PaysafecardAPI
	def self.config
		@@config ||= PaysafecardAPI::Config.new
	end

	class Config
		attr_accessor :username
		attr_accessor :password
		attr_accessor :merchant_id
		attr_accessor :merchant_name
		attr_accessor :currency
		attr_accessor :okURL
		attr_accessor :nokURL
		attr_accessor :pnURL
		attr_accessor :subId
		attr_accessor :shopId
		attr_accessor :shoplabel
		attr_accessor :api_url
		attr_accessor :panel_url

	end

	class PaysafecardError < StandardError
		attr_reader :message, :code

		def initialize(message, code = nil)
			@message = message
			@code = code
		end
	end
end

require_relative './paysafecard_api/purchase'