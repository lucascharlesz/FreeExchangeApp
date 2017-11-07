module Backoffice::CategoriesHelper
    def even_odd(index)
        "odd" if index % 2 == 1 else "even"
    end
end
