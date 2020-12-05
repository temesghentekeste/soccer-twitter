class PageView < Impression
  scope :for_type, -> (type) do
    Impression.where(impressionable_type: type)
  end
end