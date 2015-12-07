json.array!(@testimonials) do |testimonial|
  json.extract! testimonial, :id, :name, :stars, :testimonial, :date
  json.url testimonial_url(testimonial, format: :json)
end
