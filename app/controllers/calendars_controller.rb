class CalendarsController < ApplicationController

  def send_a_file(datafilepath, filename, filetype)
    File.open(datafilepath, 'r') do |f|
      send_data f.read.force_encoding('BINARY'),
        :type => filetype[:type].to_str,
        :disposition => "inline",
        :filename => filename
    end
  end

  def file_age(name)
    # returns file age in hours
    (Time.now - File.mtime(name))/(3600)
  end

  def max_age  # hours of age of file
    2
  end

  def show
    render_options = {}

    date = params[:id]

    respond_to do |format|
      uncached = params[:uncached_for_tests].present?

      format.html {
        load_data_for_date(date)
        render action: :index
      }

      format.pdf {
        filename = [
          'gneuniv',
          Pennsic.year,
          date,
        ].compact.join('-') + '.pdf'
        cache_filename = Rails.root.join('tmp', filename)

	Dir.glob(cache_filename).each { |filename| File.delete(filename) if file_age(filename) > max_age }

        if uncached or !File.exists?(cache_filename)
          render_options[:no_long_descriptions] = true
          load_data_for_date(date)
          renderer = CalendarRenderer.new(@instances, @instructables)
          data = renderer.render_pdf(render_options, filename, cache_filename)
          cache_in_file(cache_filename, data)
        end
        send_a_file cache_filename, filename, type: Mime[:pdf]
    #    send_file(cache_filename, type: Mime[:pdf], disposition: "inline; filename=#{filename}", filename: filename)
      }
    end
  end

  def index
    render_options = {}

    respond_to do |format|
      uncached = params[:uncached_for_tests].present?
      schedule = params[:schedule]
      if schedule
        raise ActiveRecord::RecordNotFound unless Instructable::SCHEDULES.include?schedule
      end
      schedule_filename_part = schedule ? schedule.downcase.gsub(/[^0-9A-Za-z]+/, '_') : nil

      format.html {
        load_data(schedule)
      }

      format.ics {
        filename = [
          'gneuniv',
          Pennsic.year,
          'all',
          schedule_filename_part,
        ].compact.join('-') + '.ics'
        cache_filename = Rails.root.join('tmp', filename)

	Dir.glob(cache_filename).each { |filename| File.delete(filename) if file_age(filename) > max_age }

        if uncached or !File.exists?(cache_filename)
          render_options[:calendar_name] = "PennsicU #{Pennsic.year}"
          load_data(schedule)
          renderer = CalendarRenderer.new(@instances, @instructables)
          data = renderer.render_ics(render_options, filename, cache_filename)
          cache_in_file(cache_filename, data)
        end
        send_a_file cache_filename, filename, type: Mime[:ics]
#        send_file(cache_filename, type: Mime[:ics], disposition: "inline; filename=#{filename}", filename: filename)
      }

      format.pdf {
        omit_descriptions = params[:brief].present?
        no_page_numbers = params[:unnumbered].present?

        filename = [
          'gneuniv',
          Pennsic.year,
          'all',
          omit_descriptions ? 'brief' : nil,
          no_page_numbers ? 'unnumbered' : nil,
          schedule_filename_part,
        ].compact.join('-') + '.pdf'
        cache_filename = Rails.root.join('tmp', filename)

	Dir.glob(cache_filename).each { |filename| File.delete(filename) if file_age(filename) > max_age }

        if uncached or !File.exists?(cache_filename)
          render_options[:omit_descriptions] = omit_descriptions
          render_options[:no_page_numbers] = no_page_numbers
          render_options[:schedule] = schedule || 'All'
          render_options[:no_long_descriptions] = params[:no_descriptions]
          render_options[:omit_table_headers] = params[:omit_table_headers]
          load_data(schedule)
          renderer = CalendarRenderer.new(@instances, @instructables)
          data = renderer.render_pdf(render_options, filename, cache_filename)
          cache_in_file(cache_filename, data)
        end
        send_a_file cache_filename, filename, type: Mime[:pdf]
#        send_file(cache_filename, type: Mime[:pdf], disposition: "inline; filename=#{filename}", filename: filename)
      }

      format.csv {
        filename = [
          'gneuniv',
          Pennsic.year,
          'all',
          schedule_filename_part,
        ].compact.join('-') + '.csv'
        cache_filename = Rails.root.join('tmp', filename)

	Dir.glob(cache_filename).each { |filename| File.delete(filename) if file_age(filename) > max_age }

        if uncached or !File.exists?(cache_filename)
          load_data(schedule)
          renderer = CalendarRenderer.new(@instances, @instructables)
          data = renderer.render_csv(render_options, "gneuniv-#{Pennsic.year}-full.csv")
          cache_in_file(cache_filename, data)
        end
        send_a_file cache_filename, filename, type: Mime[:csv]
#        send_file(cache_filename, type: Mime[:csv], disposition: "filename=#{filename}", filename: filename)
      }

      format.xlsx {
        filename = [
          'gneuniv',
          Pennsic.year,
          'all',
          schedule_filename_part,
        ].compact.join('-') + '.xlsx'
        cache_filename = Rails.root.join('tmp', filename)

	Dir.glob(cache_filename).each { |filename| File.delete(filename) if file_age(filename) > max_age }

        if uncached or !File.exists?(cache_filename)
          load_data(schedule)
          renderer = CalendarRenderer.new(@instances, @instructables)
          data = renderer.render_xlsx(render_options, filename)
          cache_in_file(cache_filename, data)
        end
        send_a_file cache_filename, filename, type: Mime[:xlsx]
#        send_file(cache_filename, type: Mime[:xlsx], disposition: "filename=#{filename}", filename: filename)
      }
    end
  end

  private

  def load_data(schedule)
    @instructables = Instructable.where(scheduled: true).order(:topic, :subtopic, :culture, :name).includes(:instances, :user)
    @instances = Instance.where(instructable_id: @instructables.map(&:id)).order('start_time, btrsort(location)').includes(instructable: [:user])
    if schedule
      @instructables = @instructables.where("schedule = ?", schedule)
      @instances = @instances.where("instructables.schedule = ?", schedule).references(:instructables)
    end
  end

  def load_data_for_date(date, end_date = '3000-01-01')
    first_date = Time.zone.parse(date).beginning_of_day
    last_date = Time.zone.parse(end_date).end_of_day
    @instructables = Instructable.where(scheduled: true).order(:topic, :subtopic, :culture, :name).includes(:instances, :user)
    @instances = Instance.where(instructable_id: @instructables.map(&:id)).where(['start_time >= ? and start_time <= ?', first_date, last_date]).order('start_time, btrsort(location)').includes(instructable: [:user])
  end

  def cache_in_file(cache_filename, data)
    if cache_filename
      tmp_filename = [cache_filename, SecureRandom.hex(16)].join
      File.open(tmp_filename, 'wb') do |f|
        f.write data
      end
      File.rename(tmp_filename, cache_filename)
    end
  end
end
