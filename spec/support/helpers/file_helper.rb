# frozen_string_literal: true

module FileHelper

  def mime_type!(filename)
    extension = File.extname(filename)
    Rack::Mime.mime_type(extension)
  end

  def open!(filename)
    path = filename.split('.').last
    path = File.expand_path("../spec/support/fixtures/#{path}", filename)
    path = File.join(path, filename)
    File.open(path)
  end

  def upload!(filename)
    ActionDispatch::Http::UploadedFile.new(
      tempfile: open!(filename),
      filename: filename,
      type: mime_type!(filename)
    )
  end

end
