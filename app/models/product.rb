class Product < ApplicationRecord

    scope :get_product_page, -> (id) { Product.limit(3).offset((id-1)*3) } 
end
