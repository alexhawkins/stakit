module UsersHelper
  def username(name)
    name.split.map(&:capitalize).join(' ')
  end

  def check_name_ending(name)
    unless name.split.count <= 1
      if name.split(//).last.downcase == 's'
        first_name = name.split.first
        last_name = name.split.last.split(//).<<("'").join
        new_name = first_name + " " + last_name
      else
        name + "'s"
      end
    else
      name
    end
  end

  #CHECK URL AND STRIP HTTP or HTTPS in output
  def strip_url(url)
    url.sub!(/https\:\/\//, '') if url.include? "https://"
    url.sub!(/http\:\/\//, '')  if url.include? "http://"
    return url
  end


end
