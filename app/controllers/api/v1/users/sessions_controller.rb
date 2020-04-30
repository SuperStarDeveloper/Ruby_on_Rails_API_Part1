module Api
  module V1
    module Users
      class SessionsController < ApplicationController
        protect_from_forgery with: :null_session
        def create
          email = params[:user][:email]
          password = params[:user][:password]
          # if request.format != :json
          #    render :status=>406, :json=>{:message=>"The request must be json"}
          #    return
          # end
          if email.nil? and password.nil?
            render :status=>400,
            :json=>{:message=>"The request must contain the user email and password."}
            return
          end
          @user=User.find_by_email(email.downcase)
          if @user.blank?
            logger.info("User #{email} failed signin, user cannot be found.")
            render :status=>401, :json=>{:message=>"Invalid email or passoword."}
            return
          end
             if not @user.valid_password?(password)
            logger.info("User #{email} failed signin, password \"#{password}\" is invalid")
            render :status=>401, :json=>{:message=>"Invalid email or password."}
          else
            sign_in("user", @user)
            render :status=>200, :json=>{:status => true,:user=>@user
              }
          end
        end

        def destroy
          
        end
      end
    end
  end
end
