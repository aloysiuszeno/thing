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
    (Date.new(2020,7,9)..Date.new(2020,7,12)).to_a
  end

  def self.dates_display
    [self.dates.first.strftime("%A, %B %e, %Y"), self.dates.last.strftime("%A, %B %e, %Y")]
  end

  def self.dates_formatted
    dates.map(&:to_s)
  end

  def self.class_dates_raw
    (Date.new(2020,7,9)..Date.new(2020,7,11)).to_a
  end

  def self.class_dates
    class_dates_raw.map(&:to_s)
  end

  def self.class_times
    [ 'Early Morning', 'Late Morning', 'Early Afternoon', 'Late Afternoon' , 'Evening']
  end
end
