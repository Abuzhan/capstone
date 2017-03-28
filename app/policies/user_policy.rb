class UserPolicy < ApplicationPolicy
	def show?
		#return true if user.admin?
		return true if record.id == user.id
	end

	def create?
		return true
	end

	def index?
		return true if record.id == user.id
	end

	def update?
		return true if user.admin?
		return true if record.id == user.id
	end

	def destroy?
		return true if user.admin?
	end

	class Scope < ApplicationPolicy::Scope
		def resolve
			scope.all
		end
	end
end