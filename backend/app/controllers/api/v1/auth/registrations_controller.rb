class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  binding.pry
  private

    def sign_up_params
      params.require(:registration).permit(:name,:email, :password)
    end
end
