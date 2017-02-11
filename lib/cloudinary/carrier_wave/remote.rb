module Cloudinary::CarrierWave
  def download!(uri, header)
    return super if !self.cloudinary_should_handle_remote?
    if respond_to?(:process_uri)
      uri = process_uri(uri)
    else # Backward compatibility with old CarrierWave
      uri = URI.parse(URI.escape(URI.unescape(uri)))
    end
    return if uri.to_s.blank?
    self.original_filename = @cache_id = @filename = File.basename(uri.path).gsub(/[^a-zA-Z0-9\.\-\+_]/, '')
    @file = RemoteFile.new(uri, @filename)
  end
end
