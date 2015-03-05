class Profile < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  def self.create_or_update_username(username, profile)
      response =  HTTParty.get(
          "https://api.github.com/users/#{username}",
          :headers => {"Authorization" => "token #{ENV['GITHUB_TOKEN']}",
                       "User-Agent" => "anyone"
          })
      if response["login"]
        profile = Profile.create(
        body: response,
        number_following: response["following"],
        number_of_followers: response["followers"],
        company_name: response["company"],
        location: response["location"],
        avatar_url: response["avatar_url"],
        username: response["login"],
        )
      end
      profile
  end

end
