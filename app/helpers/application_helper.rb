module ApplicationHelper

  def title
    content_for?(:title) ? content_for(:title).concat(' :: GGreg') : 'GGreg'
  end

  def description
    content_for(:description) || 'GGreg description' # TODO
  end

end
