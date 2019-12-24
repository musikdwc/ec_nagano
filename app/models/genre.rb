class Genre < ApplicationRecord
  enum genre_status: {
    on: 0, off: 1
  }
end
