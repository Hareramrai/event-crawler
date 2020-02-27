class EventImporter

  UPDATE_COLUMNS = %I[
    title
    sub_title
    category
    start_time
    end_time
    description
    event_url
    web_resource_id
    marked_as_deleted
    last_crawled_at
  ]

  class << self
    def import(crawled_events)
      results = Event.import crawled_events,
                             on_duplicate_key_update: {
                               conflict_target: %I[web_resource_id event_url],
                               columns: UPDATE_COLUMNS
                             }
      results.ids.size
    end
  end
end
