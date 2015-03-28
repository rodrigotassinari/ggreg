Rails.env.on(:any) do |config|
  config.autoload_paths += %W(#{config.root}/lib)
end
