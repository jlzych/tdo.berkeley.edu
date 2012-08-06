class SharedResource < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title, :file, :user_id

  has_attached_file :file,
    :path => ':rails_root/app/assets/:class/:id/:filename',
    :url => '/:class/:id/:filename'

  validates :title, :presence => true, :length => { :minimum => 3 }
  validates :user_id, :presence => true
  validates_attachment_presence :file
end
