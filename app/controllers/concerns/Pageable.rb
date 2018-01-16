module Pageable
     extend ActiveSupport::Concern

    module ClassMethods
    end


    def sorting_params(params)
        ordering = {}
        if params[:sort]
            sort_order = { '-' => :desc, '+' => :asc }
            sorted_params = params[:sort].split(',')
            sorted_params.each do |param|
                sort_sign = (param =~ /\A[+-]/) ? param.slice!(0) : '+'
                model = controller_name.titlecase.singularize.constantize
                if model.attribute_names.include?(param)
                    ordering[param] = sort_order[sort_sign]
                end
            end
        end
        ordering
    end
end