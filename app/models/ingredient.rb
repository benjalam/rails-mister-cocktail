class Ingredient < ApplicationRecord
  has_many :doses, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  # before_destroy :check_for_cocktails

 private

 def check_for_cocktails
   if doses.count > 0
     errors.add_to_base("cannot delete ingredient while cocktails exist")
     return false
   end
 end
end
