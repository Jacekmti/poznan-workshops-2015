puts 'Seeds: start'

TEACHER_TITLES = %w(Dr. Prof. TA)
FIRST_NAMES = %w(Tomasz Kazimierz Zygmunt Michał Robert Kajetan Andrzej Julian Marcin Maciej
                 Błażej Anna Julia Karolina Kinga Klaudia Michalina Angelika)
LAST_NAMES = %w(Rybarczyk Zydorek Zamrocz Sokowicz Kowalczyk Małysz Rojek Koterba
                Wach Borowicz Mrożek Mierzej)
SUBJECT_ITEMS = %w(Maths Physics Chemistry Biology History)

User.create!(email: 'admin@admin.com', password: 'adminadmin')

3.times do
  Teacher.create!(
    first_name: FIRST_NAMES.sample,
    last_name: LAST_NAMES.sample,
    academic_title: TEACHER_TITLES.sample
  )
end

teachers = Teacher.all
5.times do |i|
  SubjectItem.create!(
    title: SUBJECT_ITEMS[i],
    teacher: teachers.sample
  )
end

date_start = Date.today - 25.years
date_end = Date.today - 20.years
25.times do
  Student.create!(
    first_name: FIRST_NAMES.sample,
    last_name: LAST_NAMES.sample,
    birthdate: Time.at((date_start.to_time.to_f - date_end.to_time.to_f) * rand +
               date_end.to_time.to_f)
  )
end

students = Student.all
SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(1..8))
end

SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(3..6).times do
      subject_item.subject_item_notes << SubjectItemNote.create(student: student,
                                                                subject_item: subject_item,
                                                                value: rand(1..6))
    end
  end
end

puts 'Seeds: done'
