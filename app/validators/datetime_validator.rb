class DatetimeValidator < ActiveModel::Validator
  def validate(record)
    if Reservation.where('end_time > ? and ? > start_time', record.start_time, record.end_time).present?
      record.errors[:base] << "日付が重複しています"
    end
  end
end