class Post < ApplicationRecord
  # include PgSearch
  belongs_to :user
  # pg_search_scope :highlight, -> (highlight) { where('highlight ILIKE ?')}

  def self.search(highlight)
    Post.where("highlight ILIKE ?", "%#{highlight}%")
  end 

end
