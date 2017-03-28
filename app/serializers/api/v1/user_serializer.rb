class Api::V1::UserSerializer < Api::V1::BaseSerializer
	attributes :id, :name, :phone_number, :token, :created_at, :car_type_id, :car_type_name, :city_id, :city_name, :city_carwashes

	def token
		object.authentication_token
	end
	
	def car_type_id
		object.car_type.id	
	end

	def car_type_name
		object.car_type.name
	end

	def city_name
		object.city.name
	end

	def city_id
		object.city.id
	end

	def city_carwashes
		object.city.carwashes.map do |carwash|
				Api::V1::UserSerializer::CarwashSerializer.new(carwash, scope: scope, root: false, city: object)
			end
		end

		class CarwashSerializer < Api::V1::BaseSerializer
			attributes :id, :name, :address, :carwash_city_id, :carwash_city_name, :example

			def carwash_city_name
				object.city.name
			end

			def carwash_city_id
				object.city.id
			end

			def example
				object.prices.where("service_id = '1' and car_type_id = '1'").map do |price|
					Api::V1::UserSerializer::CarwashSerializer::PriceSerializer.new(price, scope: scope, root: false, carwash: object)
				end
			end

			class PriceSerializer < Api::V1::BaseSerializer
				attribute :price#, if: :KS_for_1?
			end
		end

end