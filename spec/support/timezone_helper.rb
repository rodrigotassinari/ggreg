RSpec.configure do |config|
  # pass `time_zone: 'Brasilia'` to an example to run it with specific timezone
  config.around(:each) do |example|
    default_timezone = Time.zone.name
    if example.metadata[:time_zone]
      current_timezone = example.metadata[:time_zone]
      raise RuntimeError.new,
        "unavailable timezone: '#{current_timezone}'" unless ActiveSupport::TimeZone.all.map(&:name).include?(current_timezone)
      Time.zone = current_timezone
      example.call
      Time.zone = default_timezone
    else
      # always set the time_zone to the system default between tests
      Time.zone = default_timezone
      example.call
      Time.zone = default_timezone
    end
  end
end
