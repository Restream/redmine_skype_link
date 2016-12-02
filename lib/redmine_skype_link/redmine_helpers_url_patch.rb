module RedmineSkypeLink
  module RedmineHelpersURLPatch
    def uri_with_safe_scheme?(uri, schemes = ['http', 'https', 'ftp', 'mailto', 'skype', 'sip', nil])
      # URLs relative to the current document or document root (without a protocol
      # separator, should be harmless
      return true unless uri.to_s.include? ':'

      # Other URLs need to be parsed
      schemes.include? URI.parse(uri).scheme
    rescue URI::InvalidURIError
      false
    end
  end
end