module FormOptions
  extend ActiveSupport::Concern

  def form_options
    Rails.cache.fetch("app/form_options") do
      { 
        styles: Style.all.map { |f|
          {
              id: f.id,
              name: f.name
          }
        },
        forms: Form.all.map { |f|
          {
              id: f.id,
              name: f.name
          }
        },
        categories: Category.all.map { |f|
          {
              id: f.id,
              name: f.name
          }
        }
      }
    end
  end
end