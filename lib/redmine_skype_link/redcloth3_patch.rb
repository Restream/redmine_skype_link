module RedmineSkypeLink
  module RedCloth3Patch
    extend ActiveSupport::Concern

    def inline_textile_link_with_skype_link(text)
      inline_textile_link_without_skype_link(text)
      text.gsub!(SKYPE_LINK_RE) do |m|
        all,pre,atts,text,title,url,proto,slash,post = $~[1..9]
        if text.include?('<br />')
          all
        else
          url, url_title = check_refs( url )
          title ||= url_title

          # Idea below : an URL with unbalanced parethesis and
          # ending by ')' is put into external parenthesis
          if ( url[-1]==?) and ((url.count("(") - url.count(")")) < 0 ) )
            url=url[0..-2] # discard closing parenth from url
            post = ")"+post # add closing parenth to post
          end
          atts = pba( atts )
          atts = " href=\"#{ htmlesc url }#{ slash }\"#{ atts }"
          atts << " title=\"#{ htmlesc title }\"" if title
          atts = shelve( atts ) if atts

          external = (url =~ /^https?:\/\//) ? ' class="external"' : ''

          "#{ pre }<a#{ atts }#{ external }>#{ text }</a>#{ post }"
        end
      end
    end

    included do
      SKYPE_LINK_RE = /
          (
          ([\s\[{(]|[#{RedCloth3::PUNCT}])?     # $pre
          "                          # start
          (#{RedCloth3::C})                     # $atts
          ([^"\n]+?)                 # $text
          \s?
          (?:\(([^)]+?)\)(?="))?     # $title
          ":
          (                          # $url
          (skype:)                   # $proto
          [[:alnum:]_\/?]\S+?
          )
          (\/)?                      # $slash
          ([^[:alnum:]_\=\/;\(\)]*?) # $post
          )
          (?=<|\s|$)
        /x

      alias_method_chain :inline_textile_link, :skype_link
    end

  end
end

unless RedCloth3.included_modules.include?(RedmineSkypeLink::RedCloth3Patch)
  RedCloth3.send :include, RedmineSkypeLink::RedCloth3Patch
end
