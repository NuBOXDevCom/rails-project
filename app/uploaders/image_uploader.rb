class ImageUploader < Shrine

  plugin :moving
  plugin :store_dimensions
  plugin :validation_helpers
  plugin :remove_invalid
  plugin :versions
  plugin :processing

  include ImageProcessing::MiniMagick

  process(:store) do |io, context|
    {
        original: io,
        thumb: resize_to_fill(io.download, 100, 100),
    }
  end

  Attacher.validate do
    validate_mime_type_inclusion %w[image/jpeg image/png image/gif]
    validate_max_size 5 * 1024 * 1024 # 5 Mb
    validate_extension_inclusion %w[jpg jpeg png gif]
  end

  def generate_location(io, context = {})
    if [:original, nil].include? context[:version]
      @filename = generate_uid(io)
    end
    extension   = ".#{io.extension}" if io.is_a?(UploadedFile) && io.extension
    extension ||= File.extname(extract_filename(io).to_s).downcase
    version = context[:version] === :original ? '' : "_#{context[:version]}"
    directory = context[:record].class.name.downcase.pluralize
    "#{directory}/#{@filename}#{version}#{extension}"
  end

end