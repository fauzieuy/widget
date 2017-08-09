# == Schema Information
#
# Table name: documents
#
#  id            :integer          not null, primary key
#  partner_id    :integer
#  filename      :string
#  content_type  :string
#  file_contents :binary
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Document < ApplicationRecord

  # associations
  belongs_to :partner

  # validations
  validate :file_size
  validate :file_extention

  def initialize(params = {})
    @file = params.delete(:file)
    super
    if @file
      file_content = ConverterRefferal.proccess(@file.read, self.partner.url)
      self.filename = sanitize_filename(@file.original_filename)
      self.content_type = @file.content_type
      self.file_contents = file_content
    end
  end

  private

    def sanitize_filename(filename)
      return File.basename(filename)
    end

    NUM_BYTES = 1048576
    def file_size
      in_megabyte = @file.size.to_f / NUM_BYTES
      if (in_megabyte) > 1
        errors.add(:file, "File size cannot be over #{@in_megabyte} MB.")
      end
    end

    EXTENTION_WISHLIST = ['.html']
    def file_extention
      if !EXTENTION_WISHLIST.include?(File.extname(filename))
        errors.add(:file, "Invalid file format.")
      end
    end
end
