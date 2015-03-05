class Repository < ActiveRecord::Base
  def self.find_or_create_from_name(content)
    repo = Repository.find_by name: content["name"]
    if repo.blank? || repo.updated_at
      Repository.create(
      name: content["name"],
      body: content,
      url: content["url"],
      language: content["language"],
      updated_at: content["updated_at"],
      number_of_forks: content["number_of_forks"],
      number_of_stars: content["number_of_stars"]
      )
    else
      return repo
    end
  end

  # def name
  #   @content["name"]
  # end
  #
  # def url
  #   @content["url"]
  # end
  #
  # def number_of_forks
  #   @content["forks_count"].to_i
  # end
  #
  # def number_of_stars
  #   @content["stargazers_count"].to_i
  # end
  #
  # def updated_at
  #   @content["updated_at"].to_datetime
  # end
  #
  # def language
  #   @content["language"]
  # end
end
