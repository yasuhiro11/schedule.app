class Task < ApplicationRecord
  validates :title, presence: { message: "を入力してください" }
  validates :start_date, presence: { message: "を入力してください" }
  validates :end_date, presence: { message: "を入力してください" }
end
