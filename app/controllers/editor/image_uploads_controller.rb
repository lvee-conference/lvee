module Editor
  class ImageUploadsController < ApplicationController
    before_action :editor_required
    layout "admin"

    COLUMNS = [:id, :file, :description, :size]
    CREATE_COLUMNS = [:file, :description]
    LIST_COLUMNS = [:description, :file, :size]

    active_scaffold :image_upload do |config|
      cls = Editor::ImageUploadsController
 
      config.columns = cls::COLUMNS
      config.create.columns = cls::CREATE_COLUMNS
      config.list.per_page = 100
    end
  end
end
