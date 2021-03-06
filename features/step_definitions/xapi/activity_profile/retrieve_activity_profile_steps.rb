# encoding: UTF-8
Given(/^a typical retrieveActivityProfile request cluster$/) do
  @user = FactoryGirl.create(:api_user)
  @lrs = @user.lrs
  @cluster = Cluster::RetrieveActivityProfile.build(@lrs, 'typical')
end

Then(/^the retrieveActivityProfile response is verified$/) do
  expect(JSON.parse(last_response.body)).to eq(activity_profile_to_hash(@cluster['primers'][0]))
end

Given(/^a typical retrieveActivityProfile request$/) do
  @user = FactoryGirl.create(:api_user)
  @lrs = @user.lrs
  @context = Request::RetrieveActivityProfile.build(@lrs, 'typical')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@user.username, @user.password)
end


def activity_profile_to_hash(profile)
  hash = {}
  hash['activityId'] = profile.activity_id
  hash['profileId'] = profile.profile_id
  hash
end