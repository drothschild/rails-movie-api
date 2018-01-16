class FilmsIndex
    DEFAULT_SORTING = {created_at: :desc}
    SORTABLE_FIELDS = [:created_at, :title, :year]
    PER_PAGE = 5

    delegate :params, to: :controller
    delegate :api_v1_films_url, to: :controller

    attr_reader :controller

    def initialize(controller)
      @controller = controller
    end

    def films
      @films ||= Film.all.paginate(page: current_page, per_page: PER_PAGE).order(sort_params)
    end

    def links
    {
      self:  api_v1_films_url(rebuild_params),
      first: api_v1_films_url(rebuild_params.merge(first_page)),
      prev:  api_v1_films_url(rebuild_params.merge(prev_page)),
      next:  api_v1_films_url(rebuild_params.merge(next_page)),
      last:  api_v1_films_url(rebuild_params.merge(last_page))
    }
  end

  private
    def current_page
      (params.to_unsafe_h.dig('page', 'number') || 1).to_i
    end

    def first_page
      {page: {number: 1}}
    end

    def next_page
      {page: {number: [total_pages, current_page + 1].min}}
    end

    def prev_page
      {page: {number: [1, current_page - 1].max}}
    end

    def last_page
      {page: {number: total_pages}}
    end

    def total_pages
      @total_pages ||= films.total_pages
    end

    def sort_params
      SortParams.sorted_fields(params[:sort], SORTABLE_FIELDS, DEFAULT_SORTING)
    end

    def rebuild_params
      @rebuild_params ||= begin
        rejected = ['action', 'controller']
        params.to_unsafe_h.reject { |key, value| rejected.include?(key.to_s) }
      end
    end
end

module SortParams
  def self.sorted_fields(sort, allowed, default)
    allowed = allowed.map(&:to_s)
    fields = sort.to_s.split(',')
    ordered_fields = convert_to_ordered_hash(fields)
    filtered_fields = ordered_fields.select { |key, value| allowed.include?(key) }
    filtered_fields.present? ? filtered_fields : default
  end

  def self.convert_to_ordered_hash(fields)
    fields.each_with_object({}) do |field, hash|
      if field.start_with?('-')
        field = field[1..-1]
        hash[field] = :desc
      else
        hash[field] = :asc
      end
    end
  end
end