class UserBookPolicy < ApplicationPolicy
    attr_reader :user, :user_book

    class Scope
        def initialize(user, scope)
          @user  = user
          @scope = scope
        end
    
        def resolve
          if user.admin?
            scope.all
          else
            scope.all
          end
        end
    
        private
    
        attr_reader :user, :scope
      end

  def initialize(user, user_book)
    @user = user
    @user_book = user_book
  end

  def create?
    !user.admin and user.id == user_book.user_id
  end
  
  def update?
    !user.admin and user.id == user_book.user_id
  end
   
end