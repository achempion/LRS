if @profile
  json.activityId @profile.activity_id
  json.profileId @profile.profile_id
end
if @profiles
  json.array! @profiles.map(&:profile_id)
end