require 'minitest/autorun'
require 'pry'

class ListAnalyzer
  def starts_with_vowel? word
    word.start_with?("a", "e", "i", "o", "u")
  end

  def number_of_words_starting_with_a_vowel group
    # words_starting_with_vowel = 0
    #   group.each do |word|
    #     if starts_with_vowel? word
    #       words_starting_with_vowel += 1
    #     end
    #   end
    # return words_starting_with_vowel
    group.count do |word|
      starts_with_vowel? word
    end
  end

  def all_words_start_with_vowels? group
    # number_of_words_starting_with_a_vowel(group) == group.length
    group.all? do |word|
      starts_with_vowel? word
    end
  end

  def some_word_starts_with_a_vowel? group
    # number_of_words_starting_with_a_vowel > 0
    group.any? do |word|
      starts_with_vowel? word
      end
  end

  # def number_of_vowels_in_all_words group
  # end
end


class ListTest < MiniTest::Test
  def test_it_can_count_vowels
    produce = ["apricot", "beet", "clementine", "date", "elderberry"]

    lister = ListAnalyzer.new

    assert_equal 2, lister.number_of_words_starting_with_a_vowel(produce)
  end

  def test_it_can_check_a_whole_list_for_matches
    mostly_vowels = ["iceberg", "ugli", "endive", "plum", "olive"]

    lister = ListAnalyzer.new
    refute lister.all_words_start_with_vowels?(mostly_vowels)

    mostly_vowels.delete "plum"
    assert lister.all_words_start_with_vowels?(mostly_vowels)
  end

  def test_it_can_check_for_a_single_example
    mostly_consonants = ["pear", "quince", "aubergine", "zucchini", "pineapple"]

    lister = ListAnalyzer.new
    assert lister.some_word_starts_with_a_vowel?(mostly_consonants)

    mostly_consonants.delete "aubergine"
    refute lister.some_word_starts_with_a_vowel?(mostly_consonants)
  end

  def test_it_can_count_all_vowels
    produce = ["apricot", "beet", "clementine", "date", "elderberry"]

    lister = ListAnalyzer.new

    assert_equal 14, lister.number_of_vowels_in_all_words(produce)
  end
end
