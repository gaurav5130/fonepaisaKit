# Fonepaisa-Kit-ROR

FonePaisa-Kit-ROR is used in most modern Ruby applications which deal with payments and transactions. It was developed for usage in Ruby on Rails web applications with help of fonepaisaPG gem.


# Setup

* Files to go through for workflow.
  - Gemfile (for adding fonepaisaPG gem)
  - app/controllers/payment_gateway_controller.rb
  - app/views/payment_gateway/pgform.html.erb


* Configuration 

  - Mode of transaction as per your app env.

  - Change the hard-coded values of pgform method variables in payment_gateway_controller.rb and paste it to your method.

  - Copy and paste the form from pgform.hmtl.erb to your hmtl file.

  ![Alt text](/images/form.png?raw=true "Form")


  - Add these three credential files in app/assets/fonepaisaCredentials - fonepaisaAPIKey.txt, priv.pem and public.pub. Or if you want to save it in any other location then change the path in payment_gateway_controller.rb

 ![Alt text](/images/path_to_file.png?raw=true "Path to Files")


  - For Cancel you can call gem method as in payment_gateway_controller.rb with paramters Privatekey, APIKey, id, merchant id and invoice. And you will get the response in JSON.

  ![Alt text](/images/cancel.png?raw=true "Cancel")


  - For inquiring any order you can call gem method as in payment_gateway_controller.rb with paramters Privatekey, APIKey, id, merchant id and invoice. And you will get the response in JSON.

  ![Alt text](/images/inquire.png?raw=true "Inquire")


  - For Confirmation you can call gem method as in payment_gateway_controller.rb with paramters Publickey, invoice, payment reference and signature And you will get the response either true or false.

  ![Alt text](/images/confirm.png?raw=true "Cancel")


  - Add fonepaisaPG gem in your gemfile.

  ![Alt text](/images/gem.png?raw=true "Gem")



* Start Transacting

  - bundle
  - rails s



# Author(s)
Gaurav Singh ( gaurav at pratishthanventures dot com )


