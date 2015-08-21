module ApplicationHelper
  def active?(*paths)
    'active' if paths.any?{ |path| current_page?(path) }
  end

  def subject_items
    SubjectItem.all
  end
end
