# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  author_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  validates :title, :author_id, presence: true
  validates :subs, length: { minimum: 1 }

  has_many :post_subs,
    class_name: 'PostSub',
    primary_key: :id,
    foreign_key: :post_id,
    dependent: :destroy,
    inverse_of: :post

  has_many :subs,
    through: :post_subs,
    source: :sub

  belongs_to :author,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :author_id

  has_many :comments,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: 'Comment',
    dependent: :destroy

end
