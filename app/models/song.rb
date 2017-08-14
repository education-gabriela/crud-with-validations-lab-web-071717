class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: [:artist_name, :release_year]}
  validates :release_year, presence: false, unless: Proc.new {|a| a.released == true}
  validates :release_year, {presence: true, unless: Proc.new {|a| a.released == false},
                            numericality: {only_integer: true, less_than_or_equal_to: Date.today.year}}
end