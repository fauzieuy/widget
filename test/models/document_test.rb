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

require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
