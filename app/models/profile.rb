class Profile < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  before_create :parse

  def initialize(username)
    @username = username
  end

  def self.create_from_username(username)

  end

  def username
    @content["login"]
  end

  def avatar_url
    @content["avatar_url"]
  end

  def location
    @content["location"]
  end

  def company_name
    @content["company"]
  end

  def number_of_followers
    @content["followers"]
  end

  def number_following
    @content["following"]
  end

  private
    def parse
      number_following = body["following"]
      #...
    end

    def cache
      if Profile.where(username: @username).blank?
        @content = HTTParty.get(
            "https://api.github.com/users/#{username}",
            :headers => {"Authorization" => "token #{ENV['GITHUB_TOKEN']}",
                         "User-Agent" => "anyone"
                        }
        )
      else
        @content = Profile.find_by(username: @username).body
      end
    end

end
