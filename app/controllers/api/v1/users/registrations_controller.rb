module Api
  module V1
    module Users
      class RegistrationsController < ApplicationController
          protect_from_forgery with: :null_session

        def create
          user = User.new(:email => params[:user][:email], :password=> params[:user][:password], :password_confirmation=> params[:user][:password])
          if user.save
            render :status=>200, :json=>{:message=>"success"}
          else
            render :status=>401, :json=>{:message=> user.errors.messages}
          end
        end
        
        def destroy
        end
      end
    end
  end
end
