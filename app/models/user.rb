class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def for_haute_couture_sql
    base = User.select(:id, :name, :created_at, :updated_at)
    base.where(id: id).or(base.where(privacy: false)).to_sql
  end
end
