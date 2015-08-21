require 'faker'

puts 'Seeds: start'
TEACHER_TITLES = %w(Dr. Prof. TA)
SUBJECT_ITEMS = %w(Maths Physics Chemistry Biology History)
User.create!(email: 'admin@admin.com', password: 'adminadmin')

3.times do
  Teacher.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
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

25.times do
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
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
