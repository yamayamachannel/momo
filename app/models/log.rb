class Log < ApplicationRecord
    belongs_to :memo

    default_scope -> { order(created_at: :desc) }
end
