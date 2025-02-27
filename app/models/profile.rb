# typed: false
# frozen_string_literal: true

class Profile < ApplicationRecord
  T.unsafe(self).include ProfileImageUploader::Attachment.new(:image)
  T.unsafe(self).include ProfileImageUploader::Attachment.new(:background_image)
  include ImageUploadable

  belongs_to :user, touch: true

  validates :description, length: {maximum: 150}
  validates :name, presence: true
  validates :url, url: {allow_blank: true}

  before_save :check_animated_gif

  def description=(description)
    value = description.present? ? description.truncate(150) : ""
    write_attribute(:description, value)
  end

  private

  def check_animated_gif
    if background_image_data_changed?
      file = uploaded_file(:background_image, size: :original)
      data = Rails.env.test? ? file.to_io : file.url
      image = MiniMagick::Image.open(data)
      self.background_image_animated = (image.frames.length > 1)
    end

    self
  end
end
