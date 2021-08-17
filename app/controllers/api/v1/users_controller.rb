class Api::V1::UsersController < ApplicationController
    acts_as_token_authentication_handler_for User, except: %i[create login], fallback_to_devise: false
    before_action :require_user_login, except: %i[create login index show logout]
    before_action :require_current_user, except: %i[create login index logout show]
    before_action :check_if_exists, only: %i[show update delete]

    def create
        if current_user
            head(:bad_request)
        else
            begin
                user = User.new(user_params)
                user.save
                render json: user, status: :created
            rescue StandardError
                render json: {message: 'Não foi possível registrar usuário'}, status: :bad_request
            end
        end
    end

    def show
        if (current_user.presence && current_user = User.find(params[:id])) || current_user.admin? == true
            user = User.find(params[:id])
            render json: user, status: :ok
        elsif current_user.presence
            head(:forbidden)
        else
            head(:unauthorized)
        end
    end

    def index
        if current_user.admin
            users = User.all
            render json: users, status: :ok
        elsif current_user.presence
            head(:forbidden)
        else
            head(:unauthorized)
        end
    end

    def update
        user = user.find(params[:id])
        user.update!(user_params)

        render json: user, status: :ok
    rescue StandardError => e
        render json: {messsage: 'Não foi possível atualizar usuário'}, status: :unprocessable_entity
    end

    def delete
        User.find(params[:id]).destroy!

        head(:ok)
    rescue StandardError => e
        render json: {message: 'Não foi possível deletar usuário'}
    end

    def login
        if current_user
            render json: {message: 'usuário já está logado'}, status: :bad_request
        else
            begin
                user = User.find_by(email: params[:email])
                if user.valid_password?(params[:password])
                    sign_in(user)
                    render json: user, status: :ok
                else
                    render json: {message: 'Senha inválida'}, status: :unauthorized
                end
            rescue StandardError
                render json: {message: 'Email inválido'}, status: :unauthorized
            end
        end
    end

    def logout
        current_user.authentication_token = nil
        current_user.save!
        sign_out(current_user)
        head(:no_content)
    rescue StandardError
        head(:bad_request)
    end

    private

    def user_params
        params.required(:user).permit(
            :email,
            :password,
            :password_confirmation,
            :username
        )
    end

    def check_if_exists
        head(:not_found) unless User.exists?(params[:id])
      end
    
      def require_user_login
        head(:unauthorized) unless current_user.presence
      end
    
      def require_current_user
        head(:forbidden) unless current_user == User.find(params[:id])
      end
end
