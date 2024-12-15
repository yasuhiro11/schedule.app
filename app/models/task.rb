class Task < ApplicationRecord
  validates :title, presence: { message: "を入力してください" }
  validates :start_date, presence: { message: "を入力してください" }
  validates :end_date, presence: { message: "を入力してください" }

  #開始日が終了日より後の場合にエラー
  validate :start_date_before_end_date

  private

  def start_date_before_end_date
    if start_date && end_date && start_date > end_date
      errors.add(:start_date, "は終了日より前の日付を選択してください")
    end
  end
end
