module RedmineSkypeLink
  module TextilePatch

    def inline_textile_link(text)
      skype_textile_link_re = /
          (
          ([\s\[{(]|[#{RedCloth3::PUNCT}])?             # $pre
          "                                             # start
          (#{RedCloth3::C})                             # $atts
          ([^"\n]+?)                                    # $text
          \s?
          (?:\(([^)]+?)\)(?="))?                        # $title
          ":
          (                                             # $url
          (\/|[a-zA-Z]+:\/\/|www\.|sip:|skype:|mailto:) # $proto
          [[:alnum:]_@\/?]\S+?
          )
          (\/)?                                         # $slash
          ([^[:alnum:]_\=\/;\(\)]*?)                    # $post
          )
          (?=<|\s|$)
        /x

      text.gsub!(skype_textile_link_re) do |m|
        all, pre, atts, text, title, url, proto, slash, post = $~[1..9]
        if text.include?('<br />')
          all
        else
          url, url_title = check_refs(url)
          title          ||= url_title

          # Idea below : an URL with unbalanced parethesis and
          # ending by ')' is put into external parenthesis
          if (url[-1]==?) and ((url.count('(') - url.count(')')) < 0))
            url  =url[0..-2] # discard closing parenth from url
            post = ')'+post # add closing parenth to post
          end
          atts = pba(atts)
          atts = " href=\"#{ htmlesc url }#{ slash }\"#{ atts }"
          atts << " title=\"#{ htmlesc title }\"" if title
          atts = shelve(atts) if atts

          external = uri_with_safe_scheme?(url) ? ' class="external"' : ''

          "#{ pre }<a#{ atts }#{ external }>#{ text }</a>#{ post }"
        end
      end
    end

  end
end
