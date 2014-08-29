module ApplicationHelper

  def app_name
    ENV['APP_NAME'] || 'ggreg'
  end

  def title
    content_for?(:title) ? content_for(:title).concat(" :: #{app_name}") : app_name
  end

  def description
    content_for(:description) || "#{app_name} description" # TODO
  end

end
