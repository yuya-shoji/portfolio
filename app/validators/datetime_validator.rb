class DatetimeValidator < ActiveModel::Validator
  def validate(record)
    if Reservation.where('end_time > ? and ? > start_time and admin_id = ?', record.start_time, record.end_time,record.admin_id).present?
      record.errors[:base] << "日付か担当者を変更してください"
    elsif record.end_time-record.start_time <= 0 || record.start_time.wday == 0 || record.start_time.wday == 6
      record.errors[:base] << "正しい日付または時刻を選択してください"
    elsif record.end_time - record.start_time > 3600
      record.errors[:base] << "予約時間は1時間以内にしてください"
    end
  end
end