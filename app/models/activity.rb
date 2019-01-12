class Activity < PublicActivity::Activity
  belongs_to :user
  belongs_to :relationship

  scope :activities_current_user,
    ->(user){where(owner_type: User.name, owner_id: user)}
  scope :sort_by_created, ->{order created_at: :DESC}
end
