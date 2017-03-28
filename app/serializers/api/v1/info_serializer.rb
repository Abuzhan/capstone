class Api::V1::InfoSerializer < Api::V1::BaseSerializer
	attributes :id, :boxes

	def boxes

		object.boxes.map do |box|
				Api::V1::InfoSerializer::BoxSerializer.new(box, scope: scope, root: false, carwash: object)
			end
		end

		class BoxSerializer < Api::V1::BaseSerializer
			attributes :id, :orders#, :name, :address, :carwash_city_id, :carwash_city_name, :example



			def orders
				object.orders.map do |order|
					Api::V1::InfoSerializer::BoxSerializer::OrderSerializer.new(order, scope: scope, root: false, box: object)
				end
			end

			class OrderSerializer < Api::V1::BaseSerializer
				attribute :id#, if: :KS_for_1?
			end
		end



end
