module URI
  def self.encode_www_form(enum)
    enum.map do |k,v|
      if v.nil?
        encode_www_form_component(k)
      elsif v.respond_to?(:to_ary)
        v.to_ary.map do |w|
          str = encode_www_form_component(k)
          unless w.nil?
            str << '='
            str << encode_www_form_component(w)
          end
        end.join('&')
      else
        str = encode_www_form_component(k)
        str << '='
        str << encode_www_form_component(v)
      end
    end.join('&')
  end

  # Encode as per AFNetworking
  #
  def self.encode_www_form_component(str)
    kAFCharactersGeneralDelimitersToEncode = ":#[]@" # does not include "?" or "/" due to RFC 3986 - Section 3.4
    kAFCharactersSubDelimitersToEncode = "!$&'()*+,;=" #

    allowedCharacterSet = NSCharacterSet.URLQueryAllowedCharacterSet.mutableCopy
    allowedCharacterSet.removeCharactersInString(kAFCharactersGeneralDelimitersToEncode.stringByAppendingString(kAFCharactersSubDelimitersToEncode))

    str.stringByAddingPercentEncodingWithAllowedCharacters(allowedCharacterSet).mutableCopy
  end

  def self.decode_www_form(str)
    str.split("&").inject({}) do |hash, component|
      key, value = component.split("=", 2)
      hash[decode_www_form_component(key)] = decode_www_form_component(value)

      hash
    end
  end

  def self.decode_www_form_component(str)
    str.gsub("+", " ").stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
  end

  def self.split(str)
    url = NSURL.URLWithString(str)

    scheme = url.scheme
    user = url.user
    password = url.password
    hostname = url.host
    port = url.port
    path = url.path
    query = url.query
    fragment = url.fragment

    user_info = nil
    if user || password
      user_info = "#{user}:#{password}"
    end

    [scheme, user_info, hostname, port, path, query, fragment]
  end
end
