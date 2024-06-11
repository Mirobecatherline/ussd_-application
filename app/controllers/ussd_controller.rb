class UssdController < ApplicationController
    skip_before_action :verify_authenticity_token

    def handle_ussd
        session_id   = params[:sessionId]
        service_code = params[:serviceCode]
        phone_number = params[:phoneNumber]
        text         = params[:text]
    
        # Initialize response
        response  = "CON Welcome my name is cate_mirobe\n"
        response += "1. Know my age\n"
        response += "2. Know my gender\n"
    
        # Logic to handle the USSD text
        case text
        when ''
          # First request, show the main menu
          response
        when '1'
          # Handle balance check
          response = "END My age is 27"
        when '2'
          # Handle airtime purchase
          response = "END Am female"
        else
          response = "END Invalid choice"
        end
    
        render plain: response
      end
end
