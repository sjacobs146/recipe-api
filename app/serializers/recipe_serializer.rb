class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :id, :name, :serves, :category, :ingredients, :directions
end
