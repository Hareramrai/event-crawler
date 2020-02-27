class EventTime
  def initialize(time_string)
    @time_string = time_string
  end

  def date_time
    return time_string if is_valid_string?

    time_string.gsub(/[a-zA-Z]/, '').squish
  end

  private

  attr_reader :time_string

  def is_valid_string?
    Time.zone.iso8601(time_string)
    return true
  rescue ArgumentError
    false
  end
end
