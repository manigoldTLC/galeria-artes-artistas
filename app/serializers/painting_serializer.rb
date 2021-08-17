class PaintingSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id

  def image_url
    if painting.images.attached?
        rails_blob_path(painting, only_path: true)
      end
    else
      'Sem imagem'
    end
  end

end
