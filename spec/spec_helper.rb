require 'rubygems'
require 'bundler/setup'

environment = :test

Bundler.require(:default, environment)

require 'rspec'
require 'webmock/rspec'
require 'soap/wsdlDriver'
require_relative "../lib/paysafecard_api"
require_relative "./paysafecard_service_responses"

PaysafecardAPI.config.username = "psc_red5studiosinc_test"
PaysafecardAPI.config.password = "J653KGEGGARYI"
PaysafecardAPI.config.merchant_id = '1000004809'
PaysafecardAPI.config.merchant_name = 'Red 5 Studios, Inc'
PaysafecardAPI.config.currency = 'EUR'
PaysafecardAPI.config.okURL = ""
PaysafecardAPI.config.nokURL = ""
PaysafecardAPI.config.pnURL = "paysafecard/exec_transaction"
PaysafecardAPI.config.subId = ""
PaysafecardAPI.config.shopId = ""
PaysafecardAPI.config.shoplabel = ""
PaysafecardAPI.config.api_url = "https://soatest.paysafecard.com/psc/services/PscService?wsdl"
PaysafecardAPI.config.panel_url = "https://customer.test.at.paysafecard.com/psccustomer/GetCustomerPanelServlet?mid="

RSpec.configure do |config|
	config.mock_with :rspec

	config.before(:suite) do
		WebMock.disable_net_connect!
	end
end
