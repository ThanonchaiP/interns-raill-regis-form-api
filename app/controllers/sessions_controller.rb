class SessionsController < ApplicationController

    def sign_up
        user = User.new(user_params)
        if user.save
            render json: {success: true}, status: :created
        else
            # render raise BadError.new("ไม่สามารถเพิ่มข้อมูลได้")
            render json: {success: false, errors: user.errors.as_json}, status: :bad_request
        end
    end

    def sign_in
        user = User.find_by_email(params[:user][:email])
        raise AuthenticationError.new("อีเมลหรือรหัสผ่านไม่ถูกต้อง") if !user
        if user.valid_password?(params[:user][:password])
            render json: {success: true, jwt: user.jwt(1.days.from_now)}, status: :ok
        else
            raise AuthenticationError.new("อีเมลหรือรหัสผ่านไม่ถูกต้อง")
        end
    end

    def sign_out
        @current_user.generate_auth_token(true)
        @current_user.save
        render json: { success: true }
    end

    def me
        render json: { success: true, user: @current_user }
    end

    private
    def user_params
      params.require(:user).permit(:email, :fullname, :password, :password_confirmation)
    end

end
# class SessionsController < ApplicationController
#     before_action :set_current_client_from_jwt, only: [:me, :sign_out]

#     def sign_up
#         client = Client.new(client_params)
#         if client.save
#             render json: {success: true}, status: :created
#         else
#             # render raise BadError.new("ไม่สามารถเพิ่มข้อมูลได้")
#             render json: {success: false, errors: client.errors.as_json}, status: :bad_request
#         end
#     end

#     def sign_in
#         client = Client.find_by_email(params[:client][:email])
#         if client.valid_password?(params[:client][:password])
#             render json: {success: true, jwt: client.jwt(1.days.from_now)}, status: :created
#         else
#             raise AuthenticationError.new("อีเมลหรือรหัสผ่านไม่ถูกต้อง")
#         end
#     end

#     def sign_out
#         @current_client.generate_auth_token(true)
#         @current_client.save
#         render json: { success: true }
#     end

#     def me
#         # set_current_client_from_jwt
#         render json: { success: true, client: @current_client}
#     end

#     private
#     def client_params
#       params.require(:client).permit(:first_name, :last_name, :gender_id, :birthday,
#                                      :phone, :email, :house_no, :sub_district_id, :district_id,
#                                      :province_id, :postcode, :race_id, :shirt_size_id, :image,
#                                      :password, :password_confirmation)
#     end

# end
