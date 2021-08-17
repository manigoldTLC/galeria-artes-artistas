class PaintingSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description, :artist, :image_url

  def image_url
    if object.image.attached?
        rails_blob_path(object.image, only_path: true)
    else
      'Sem imagem'
    end
  end

end