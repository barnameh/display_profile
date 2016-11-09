require 'minitest/autorun'
require 'minitest/pride'
require_relative 'repository_list'

class RepositoryListTest < Minitest::Test

  def test_class_exists
    assert RepositoryList
  end

  def test_can_access_github_repositories
    repos = RepositoryList.new.get("barnameh")
    binding.pry
    assert_match(/Blackjack/, repos[0]["name"])
  end
end
