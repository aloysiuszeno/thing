class Pennsic
  def self.year
    Time.now.year - 1986 #GNE YEAR
  end

  # Year AS, during event
  def self.as
    'LVII'
  end

  def self.calendar_year
    Time.now.year
  end

  # These are the dates for Great Northeastern War GNE
  def self.dates
    (Date.new(2022,7,14)..Date.new(2022,7,17)).to_a
  end

  def self.dates_display
    [self.dates.first.strftime("%A, %B %e, %Y"), self.dates.last.strftime("%A, %B %e, %Y")]
  end

  def self.dates_formatted
    dates.map(&:to_s)
  end

  # these are the dates we allow classes - nothing sunday, basically
  def self.class_dates_raw
    (Date.new(2022,7,14)..Date.new(2022,7,16)).to_a
  end

  def self.class_dates
    class_dates_raw.map(&:to_s)
  end

  def self.class_times
    [ 'Early Morning', 'Late Morning', 'Early Afternoon', 'Late Afternoon' , 'Evening']
  end
end
