class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :serves, :category, :ingredients, :directions, \
             :user_id, :editable

  def editable
    scope == object.user
  end
end
