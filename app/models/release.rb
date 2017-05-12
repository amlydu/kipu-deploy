class Release < ApplicationRecord
  belongs_to :release_main
  belongs_to :instance

  has_many :logs
end
