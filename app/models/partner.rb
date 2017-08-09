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

class Partner < ApplicationRecord

  # associations
  has_many :documents

  # validations
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :url
  validates_uniqueness_of :url
  validates :url, :format => { :with => URI::regexp(%w(http https)), :message => "Valid URL required"}
end
