class DatetimeValidator < ActiveModel::Validator
  def validate(record)
    if Reservation.where('end_time > ? and ? > start_time and admin_id = ?', record.start_time, record.end_time,record.admin_id).present?
      record.errors[:base] << "日付か担当者を変更してください"
    end
  end
end