class Schedule < ApplicationRecord
    validates :title,presence:true,length:{maximum:20}
    validates :startday,presence:true
    validates :endday,presence:true
    validates :text,length:{maximum:500}
    validate :endday_error

    def endday_error
        if startday.blank? || endday.blank?
            errors.add(:endday_error,"開始日と終了日の両方を入力してください")
        elsif startday > endday
            errors.add(:endday_error,"終了日は開始日より後の日付を入力してください。") 
        end
    end
end
