class RepositoryList
  attr_reader :repositories

  def initialize(username)
    results = HTTParty.get(
        "https://api.github.com/users/#{username}/repos?sort=updated",
        :headers => {"Authorization" => "token #{ENV['GITHUB_TOKEN']}",
                     "User-Agent" => "anyone"
                    }
    )
    @repositories = results.map {|r| Repository.find_or_create_from_name(r)}
  end
end
