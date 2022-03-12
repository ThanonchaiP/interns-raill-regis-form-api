class ApplicationController < ActionController::API
    before_action :set_current_user_from_jwt, only: [:me, :sign_out]
    # rescue
    rescue_from BadError, with: :rescue_bad_error
    rescue_from NotFoundError, with: :rescue_not_found_error
    rescue_from AuthenticationError, with: :rescue_authentication_error
    
    # JWT rescue
    rescue_from JWT::DecodeError, with: :rescue_authentication_error
    rescue_from JWT::ExpiredSignature, with: :rescue_authentication_error
    rescue_from JWT::ImmatureSignature, with: :rescue_authentication_error
    rescue_from JWT::InvalidIssuerError, with: :rescue_authentication_error
    rescue_from JWT::InvalidIatError, with: :rescue_authentication_error
    rescue_from JWT::VerificationError, with: :rescue_authentication_error

    def set_current_user_from_jwt
        auth_header = request.headers["Authorization"]
        raise AuthenticationError.new("ไม่พบ Token") if auth_header.blank?
        bearer = auth_header.split.first
        raise AuthenticationError.new("Bad format") if bearer != "Bearer"
        jwt = auth_header.split.last
        raise AuthenticationError.new("ไม่พบ Token") if jwt.blank?
        key = Rails.application.credentials.secret_key_base
        decoded = JWT.decode(jwt, key, 'HS256')
        payload = decoded.first
        if payload.blank? || payload["auth_token"].blank?
            raise AuthenticationError.new("Bad Token")
        end
        @current_user = User.find_by_auth_token(payload["auth_token"])
        raise AuthenticationError.new("Bad Token") if @current_user.blank?
    end

    def verify_token
        auth_header = request.headers["Authorization"]
        raise AuthenticationError.new("ไม่พบ Token") if auth_header.blank?
        bearer = auth_header.split.first
        raise AuthenticationError.new("Bad format") if bearer != "Bearer"
        jwt = auth_header.split.last
        raise AuthenticationError.new("ไม่พบ Token") if jwt.blank?
        key = Rails.application.credentials.secret_key_base
        decoded = JWT.decode(jwt, key, 'HS256')
        payload = decoded.first
        #check Token Expired
        # if (Time.now).to_i >= payload["exp"] * 1000
        #     raise AuthenticationError.new("Signature has expired")
        # end
        if payload.blank? || payload["auth_token"].blank?
            raise AuthenticationError.new("Bad Token")
        end
    end

    private
    def rescue_bad_error(error)
        render json: { success: false, message: error.to_s }, status: :bad_request and return
    end
    def rescue_not_found_error(error)
        render json: { success: false, message: error.to_s }, status: :not_found and return
    end
    def rescue_authentication_error(error)
        render json: { success: false, message: error.to_s }, status: :unauthorized and return
    end
end
