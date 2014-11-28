class Movie < ActiveRecord::Base
  has_many :reviews

  mount_uploader :poster, PosterUploader

  validates :title, :director, :description, :release_date, :poster, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }
  validate :release_date_is_in_the_future

  scope :includes_title, -> (title) { where("title like ?", title) }
  scope :includes_director, -> (director) { where("director like ?", director) }

  # def self.search_results(params) 
  scope :search_results, -> (params) do 
    if params[:title].present?
      @movies = Movie.includes_title(params[:title])

    elsif params[:director].present?
      @movies = Movie.includes_director(params[:director])
    end
  end

  # def self.search_duration(params) 
  scope :search_duration, -> (params) do
    case params[:duration]
    when "1"
     then where("runtime_in_minutes <= ?", 90)
    when "2"
      then where("runtime_in_minutes ? and ?", 90, 120)
    when "3"
      then where("runtime_in_minutes >= ?", 120)
    end
  end

  def review_average
    if reviews.size > 0
      return reviews.sum(:rating_out_of_ten)/reviews.size * 1.0
    end
    0.0
  end

  protected

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should probably be in the future") if release_date < Date.today
    end
  end
end

