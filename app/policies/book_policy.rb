class BookPolicy
  attr_reader :user, :book

  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else
        scope.where(id: 1)
      end
    end

    private

    attr_reader :user, :scope
  end

  def initialize(user, book)
    @user = user
    @book = book
  end

  def index?
    @user!= nil
  end

  def show?
    @user!= nil
  end

  def edit?
    update?
  end
  
  def update?
    @user.admin
  end

  def new?
    create?
  end
  
  def create?
    @user.admin
  end

  def destroy?
    @user.admin
  end

end