# frozen_string_literal: true

module FileHelper

  def upload(filename)
    ActionDispatch::Http::UploadedFile.new(
      tempfile: tempfile(filename),
      filename: filename
    )
  end

  private

  def tempfile(filename)
    path = filename.split('.').last
    path = File.expand_path("../spec/support/fixtures/#{path}", filename)
    path = File.join(path, filename)
    File.open(path)
  end

end
