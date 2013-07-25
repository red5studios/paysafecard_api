# coding: utf-8

module PaysafecardAPI
	class Purchase
		class MissingPaymentSession < StandardError; end

		def self.create_disposition(params)
			@client = SOAP::WSDLDriverFactory.new(PaysafecardAPI.config.api_url).create_rpc_driver()
			@client.wiredump_dev = STDOUT
	        @client.createDisposition(
                'username'=>params[:username],
                'password'=>params[:password],
                'mtid'=>params[:mtid],
                'subId'=>nil,
                'amount'=> sprintf('%0.02f',params[:amount].to_f/100),
                'currency'=>params[:currency],
                'okUrl'=>params[:okUrl],
                'nokUrl'=>params[:nokUrl],
                'pnUrl'=>params[:pnUrl],
                'clientIp'=>params[:clientIp],
                'merchantclientid'=>params[:merchantclientid]        
	        ).createDispositionReturn
		end

	    def self.get_serial_numbers(params)
			@client = SOAP::WSDLDriverFactory.new(PaysafecardAPI.config.api_url).create_rpc_driver()
			@client.wiredump_dev = STDOUT
	        @client.getSerialNumbers(
                'username'=>params[:username],
                'password'=>params[:password],
                'mtid'=>params[:mtid],
                'subId'=>nil,
                'currency'=>params[:currency]
	        ).getSerialNumbersReturn
	    end

	    def self.get_mid(params)
			@client = SOAP::WSDLDriverFactory.new(PaysafecardAPI.config.api_url).create_rpc_driver()
			@client.wiredump_dev = STDOUT
	        @client.getMID(
                'username'=>params[:username],
                'password'=>params[:password],
                'currency'=>params[:currency]
	        ).getMID
	    end	    	

	    def self.execute_debit(params)
			@client = SOAP::WSDLDriverFactory.new(PaysafecardAPI.config.api_url).create_rpc_driver()
			@client.wiredump_dev = STDOUT	    	
	        @client.executeDebit(
                'username'=>params[:username],
                'password'=>params[:password],
                'mtid'=>params[:mtid],
                'subId'=>nil,
                'amount'=> sprintf('%0.02f',params[:amount].to_f/100),
                'currency'=>params[:currency],
	            'close'=>1,
	            'partialDebitId'=>nil
	        ).executeDebitReturn
	    end		

	end
end