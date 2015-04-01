class TwitterIntegration < Integration

  CONFIGURATION_KEYS = %w( consumer_key consumer_secret access_token access_token_secret )

  store_accessor :configuration, *CONFIGURATION_KEYS

  validate :configuration_is_present

  CONFIGURATION_KEYS.each do |key|
    validates key.to_sym, presence: true
  end

  # all four
  def valid_configuration?
    !configuration.nil? &&
      !configuration.empty? &&
      CONFIGURATION_KEYS.map { |key| configuration[key].blank? }.uniq == [false]
  end

  private

  # validation
  def configuration_is_present
    errors.add(:configuration, :invalid) unless valid_configuration?
  end

end
