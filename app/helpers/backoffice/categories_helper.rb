module Backoffice::CategoriesHelper
    def even_odd(index)
        if index % 2 == 1 then "odd" else "even" end
    end

    def active(active)
        if active
            return 'fa fa-check-square-o'
        else
            return 'fa fa-square-o'
        end
    end
end
