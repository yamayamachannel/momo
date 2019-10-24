json.extract! memo, :id, :title, :bank, :wallet, :sum, :created_at, :updated_at
json.url memo_url(memo, format: :json)
