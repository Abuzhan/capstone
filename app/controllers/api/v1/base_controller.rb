class Api::V1::BaseController < ApplicationController
	include Pundit
	include ActiveHashRelation
	#require 'active_support'


	protect_from_forgery with: :null_session

	before_action :destroy_session

	rescue_from ActiveRecord::RecordNotFound, with: :not_found!
	rescue_from Pundit::NotAuthorizedError, with: :unauthorized!

	attr_accessor :current_user
	protected
	
	def destroy_session
		request.session_options[:skip] = true
	end

	def unauthenticated!
		response.headers['WWW-Authenticate'] = "Token realm=Application"
		render json: { error: 'Bad credentials' }, status: 401
	end

	def unauthorized!
		render json: { error: 'not authorized' }, status: 403
	end

	def invalid_resource!(errors = [])
		api_error(status: 422, errors: errors)
	end

	def not_found!
		return api_error(status: 404, errors: 'Not found')
	end

	def api_error(status: 500, errors: [])
		unless Rails.env.production?
			puts errors.full_messages if errors.respond_to? :full_messages
		end
		head status: status and return if errors.empty?

		render json: jsonapi_format(errors).to_json, status: status
	end

	def jsonapi_format(errors)
		return errors if errors.is_a? String
		errors_hash = {}
		errors.messages.each do |attribute, error|
			array_hash = []
			error.each do |e|
				array_hash << {attribute: attribute, message: e}
			end
			errors_hash.merge!({ attribute => array_hash })
		end
		return errors_hash
	end

	def authenticate_user!
		#token, options = ActionController::HttpAuthentication::Token.token_and_options(request)
		#user_phone_number = options.blank?? nil : options[:phone_number]
		


		authenticate_or_request_with_http_token do |token, options|
			User.exists?(authentication_token: token)
			user = User.find_by(authentication_token: token)
			@current_user = user
			#@current_user = user
		end

		
		#

		#if user && ActiveSupport::SecurityUtils.secure_compare(user.authentication_token, token)
		#	@current_user = user
		#else
		#	return unauthenticated!
		#end
		
	end
end