require File.expand_path('../../test_helper', __FILE__)

class RedmineSkypeLinkTest < ActiveSupport::TestCase
  def test_audio_call_implicit
    assert_link 'skype:skype.test.user.1;skype.test.user.2'
  end

  def test_audio_call_explicit
    assert_link 'skype:skype.test.user.1;skype.test.user.2?call'
  end

  def test_chat
    assert_link 'skype:skype.test.user.1;skype.test.user.2?chat'
  end

  def test_chat_with_blob
    assert_link 'skype:?chat&blob=1234567890zxcvbnmm-ASDFGH'
  end

  def assert_link(skype_link)
    html = RedCloth3.new("\"link\":#{skype_link}").to_html
    expect_link = Regexp.escape skype_link.gsub(/&/, '&#38;')
    assert_match /<a href="#{expect_link}">link<\/a>/, html
  end
end
