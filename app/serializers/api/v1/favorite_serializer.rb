class Api::V1::FavoriteSerializer < Api::V1::BaseSerializer
	has_many :favorite_carwashes, serializer: Api::V1::CarwashSerializer
end