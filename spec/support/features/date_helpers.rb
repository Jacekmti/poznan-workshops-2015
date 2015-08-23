module Features
  module DateHelpers
    def select_date(date, options = {})
      field = options[:from]
      select date.year.to_s,                from: "#{field}_1i"
      select Date::MONTHNAMES[date.month],  from: "#{field}_2i"
      select date.day.to_s,                 from: "#{field}_3i"
    end
  end
end
