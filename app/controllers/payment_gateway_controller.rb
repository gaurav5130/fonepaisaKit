class PaymentGatewayController < ApplicationController
	FonepaisaAPIKey = File.read(File.expand_path('..',__FILE__) + '/../assets/fonepaisaCredentials/fonepaisaAPIKey.txt')
	FonepaisaPrivKey = File.read(File.expand_path('..',__FILE__) + '/../assets/fonepaisaCredentials/priv.pem')
	FonepaisaPubKey = File.read(File.expand_path('..',__FILE__) + '/../assets/fonepaisaCredentials/public.pub')
	def pgform
		if Rails.env.test? || Rails.env.development?
			@form_submit = 'https://test.fonepaisa.com/pg/pay'
		elsif Rails.env.production?
			@form_submit = 'https://secure.fonepaisa.com/pg/pay'
		else
			@form_submit = 'https://test.fonepaisa.com/pg/pay'
		end
		@msg_name = 'request_payment'
		@id = "FPTEST"         
		@merchant_id = "FPTEST"
		@merchant_display = "FonePaisa Merchant"
		@invoice = "ORDER100"
		@invoice_amt = "10.00"
		@amount = "10.00"
		@email = 'merchant@fonepaisa.com'
		@mobile_no = '9999999999'
		@callback_url = 'https://test.fonepaisa.com/tpgt/cfm.jsp'
		@callback_failure_url = 'https://test.fonepaisa.com/tpgt/fail.jsp'
		@sign = FonepaisaPG::Functions.new.get_sign(FonepaisaPrivKey,FonepaisaAPIKey,@id,@merchant_id,@invoice,@invoice_amt)
	end 

	def inYourMethod		
		id = "FPTEST"         
		merchant_id = "FPTEST"
		invoice = "ORDER100"
		paymentReference = '160908122814812'
		signature = '69ef7fcdd08bb7c41020a9b579ef3be1604f8dc3954360f827fe8853a4faf3f22fa3dd6fabaaa01ef1908b5b84fae75368890784585747e82082573c3704246ccc810a31fbae3dc79e0186f423ab06abd97163c670b11cccbd1d08c540bdf15e5fa70d3fc9781c79c53611b7b39bf1ccd3815e7ff8de1de626357dbc537e6d14cef597c3dc87cc70c7ca017e050098a7e68255cc60a42033af97c8c1b14765e40b079e0b3d26fee8bdcd07fef767eba4d68038bbdd0e3781ff44b731c26c675f340c51ffd109f73824595c32ad11ec3fb959d5cae769a2a7e2d4299bbbfaa4aa750ef31c341e244d0b78147d18f1d3c745864f721b2b67fa3813248e5ae15a1e'
		#For cancellation call gem method as below
		cancelResponse = FonepaisaPG::Functions.new.cancel(FonepaisaPrivKey,FonepaisaAPIKey,id,merchant_id,invoice)
		#For inquire call gem methos as below
		inquireResponse = FonepaisaPG::Functions.new.inquire(FonepaisaPrivKey,FonepaisaAPIKey,id,merchant_id,invoice)
		#For confirmation call gem methos as below
		confirmResponse = FonepaisaPG::Functions.new.confirm(FonepaisaPubKey,invoice,paymentReference,signature)
	end
end
