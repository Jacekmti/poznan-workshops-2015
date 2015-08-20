class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(_subject_item)
    avg = subject_item_notes.where(subject_item: _subject_item).average('value')
    avg = !avg.nil? ? avg.round(2).to_f : 0.0
    '%.2f' % avg
  end
end
