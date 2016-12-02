require File.expand_path('../../test_helper', __FILE__)

class RedmineSkypeLinkTest < ActiveSupport::TestCase

  def test_textile_audio_call_implicit
    assert_textile_link_match(
      '<a href="skype:skype.test.user.1;skype.test.user.2" class="external">link</a>',
      '"link":skype:skype.test.user.1;skype.test.user.2'
    )
  end

  def test_textile_audio_call_explicit
    assert_textile_link_match(
      '<a href="skype:skype.test.user.1;skype.test.user.2?call" class="external">link</a>',
      '"link":skype:skype.test.user.1;skype.test.user.2?call'
    )
  end

  def test_textile_chat
    assert_textile_link_match(
      '<a href="skype:skype.test.user.1;skype.test.user.2?chat" class="external">link</a>',
      '"link":skype:skype.test.user.1;skype.test.user.2?chat'
    )
  end

  def test_textile_chat_with_blob
    assert_textile_link_match(
      '<a href="skype:?chat&#38;blob=1234567890zxcvbnmm-ASDFGH" class="external">link</a>',
      '"link":skype:?chat&blob=1234567890zxcvbnmm-ASDFGH'
    )
  end

  def test_textile_skype_for_business
    assert_textile_link_match(
      '<a href="sip:somebody.unknown1@has.this.mail" class="external">link</a>',
      '"link":sip:somebody.unknown1@has.this.mail'
    )
  end

  def test_markdown_audio_call_implicit
    assert_markdown_link_match(
      '<a href="skype:skype.test.user.1;skype.test.user.2" class="external">link</a>',
      '[link](skype:skype.test.user.1;skype.test.user.2)'
    )
  end

  def test_markdown_audio_call_explicit
    assert_markdown_link_match(
      '<a href="skype:skype.test.user.1;skype.test.user.2?call" class="external">link</a>',
    '[link](skype:skype.test.user.1;skype.test.user.2?call)'
    )
  end

  def test_markdown_chat
    assert_markdown_link_match(
      '<a href="skype:skype.test.user.1;skype.test.user.2?chat" class="external">link</a>',
      '[link](skype:skype.test.user.1;skype.test.user.2?chat)'
    )
  end

  def test_markdown_chat_with_blob
    assert_markdown_link_match(
      '<a href="skype:?chat&amp;blob=1234567890zxcvbnmm-ASDFGH" class="external">link</a>',
      '[link](skype:?chat&blob=1234567890zxcvbnmm-ASDFGH)'
    )
  end

  def test_markdown_skype_for_business
    assert_markdown_link_match(
      '<a href="sip:somebody.unknown1@has.this.mail" class="external">link</a>',
      '[link](sip:somebody.unknown1@has.this.mail)'
    )
  end

  private

  def assert_textile_link_match(expected_html, skype_link)
    with_settings text_formatting: 'textile' do
      formatter = Redmine::WikiFormatting::Textile::Formatter
      html      = formatter.new(skype_link).to_html
      assert_match expected_html, html
    end
  end

  def assert_markdown_link_match(expected_html, skype_link)
    with_settings text_formatting: 'markdown' do
      formatter = Redmine::WikiFormatting::Markdown::Formatter
      html      = formatter.new(skype_link).to_html
      assert_match expected_html, html
    end
  end
end
