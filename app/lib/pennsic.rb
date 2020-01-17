class Pennsic
  def self.year
    Time.now.year - 1986 #GNE YEAR
  end

  def self.as
    'LV'
  end

  def self.calendar_year
    Time.now.year
  end

  def self.dates
    (Date.parse('2020-07-09')..Date.parse('2019-07-12')).to_a
  end

  def self.dates_formatted
    dates.map(&:to_s)
  end

  def self.class_dates_raw
    (Date.parse('2019-07-10')..Date.parse('2018-07-11')).to_a
  end

  def self.class_dates
    class_dates_raw.map(&:to_s)
  end

  def self.class_times
    [ 'Early Morning', 'Late Morning', 'Early Afternoon', 'Late Afternoon' ]
  end
end
