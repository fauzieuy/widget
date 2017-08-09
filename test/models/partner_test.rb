# == Schema Information
#
# Table name: partners
#
#  id            :integer          not null, primary key
#  name          :string           default(""), not null
#  counter_click :integer          default("0")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  url           :string
#

require 'test_helper'

class PartnerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
