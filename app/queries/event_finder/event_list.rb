module EventFinder
  class EventList
    attr_accessor :initial_scope

    def initialize(initial_scope)
      @initial_scope = initial_scope
    end

    def call(params)
      scoped = filter_by_web_resource(initial_scope, params[:web_resource])
      scoped = filter_by_title(scoped, params[:search])
      scoped = filter_by_range(scoped, params[:date_range])
      scoped
    end

    private

    attr_accessor :initial_scope

    def filter_by_web_resource(scoped, web_resource)
      return scoped if web_resource.blank?

      scoped.where(web_resource_id: web_resource)
    end

    def filter_by_title(scoped, search)
      return scoped if search.blank?

      search_key = "%#{search}%"

      scoped.where('title ILIKE :search_key', search_key: search_key)
    end

    def filter_by_range(scoped, date_range)
      return scoped if date_range.blank?

      scoped.where(start_time: split_dates(date_range))
    end

    def split_dates(date_range)
      splitdates = date_range.split(/-/)
      beginning_string, finish_string = splitdates.collect(&:strip)

      start_date = Date.parse(beginning_string).beginning_of_day

      end_date = Date.parse(finish_string).end_of_day

      start_date..end_date
    end
  end
end
