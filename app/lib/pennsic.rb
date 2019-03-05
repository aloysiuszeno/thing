class Pennsic
  def self.year
    Time.now.year - 1986 #GNE YEAR
  end

  def self.as
    'LIV'
  end

  def self.calendar_year
    Time.now.year
  end

  def self.dates
    (Date.parse('2019-07-11')..Date.parse('2019-07-14')).to_a
  end

  def self.dates_formatted
    dates.map(&:to_s)
  end

  def self.class_dates_raw
    (Date.parse('2019-07-12')..Date.parse('2018-07-13')).to_a
  end

  def self.class_dates
    class_dates_raw.map(&:to_s)
  end

  def self.class_times
    [ '9am to Noon', 'Noon to 3pm', '3pm to 6pm' ]
  end
end
