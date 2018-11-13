# Helpers for better embedding and manipulation of videos
# Place this code in app/helpers/videos_helper.rb
# Then from any view you can add:
#
#    <%= get_video_iframe('http://the.video.url') %>
#
# Optionally you can add width and height.
#
#    <%= get_video_iframe('http://the.video.url', '1600px', '900px') %>
#
# Thanks to https://stackoverflow.com/a/27878890/1498118
module ApplicationHelper

  # Regex to find YouTube's and Vimeo's video ID
  YOUTUBE_REGEX = %r(^(http[s]*:\/\/)?(www.)?(youtube.com|youtu.be)\/(watch\?v=){0,1}([a-zA-Z0-9_-]{11}))
  VIMEO_REGEX = %r(^https?:\/\/(?:.*?)\.?(vimeo)\.com\/(\d+).*$)

  # Finds YouTube's video ID from given URL or [nil] if URL is invalid
  # The video ID matches the RegEx \[a-zA-Z0-9_-]{11}\
  def find_youtube_id url
    url = sanitize url
    matches = YOUTUBE_REGEX.match url.to_str
    if matches
      matches[6] || matches[5]
    end
  end

  # Get YouTube video iframe from given URL
  def get_youtube_iframe boulder, width, height
    youtube_id = find_youtube_id boulder.link
    seconds = ((boulder.position_min.to_i*60)+ boulder.position_sec.to_i).to_s
    timestamp = "?start=#{seconds}"
    #timestamp = "t=#{boulder.position_min}m#{boulder.position_sec}s"
    result = %(<iframe title="YouTube video player" width="#{width}"
                height="#{height}" src="//www.youtube.com/embed/#{youtube_id}#{timestamp}"
                frameborder="0" allowfullscreen></iframe>)
    result.html_safe
  end

  # Finds Vimeo's video ID from given URL or [nil] if URL is invalid
  def find_vimeo_id url
    url = sanitize url
    matches = VIMEO_REGEX.match url.to_str
    matches[2] if matches
  end

  # Get Vimeo video iframe from given URL
  def get_vimeo_iframe boulder, width, height
    vimeo_id = find_vimeo_id boulder.link
    timestamp = "#t=#{boulder.position_min}m#{boulder.position_sec}s"

    result = %(<iframe src="https://player.vimeo.com/video/#{vimeo_id}#{timestamp}" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>)
    result.html_safe
  end

  # Main function
  # Return a video iframe
  # If the url provided is not a valid YouTube or Vimeo url it returns [nil]
  def get_video_iframe(boulder, width = "560px", height = "315px")
    if find_vimeo_id(boulder.link)
      get_vimeo_iframe(boulder, width, height)
    elsif find_youtube_id(boulder.link)
      get_youtube_iframe(boulder, width, height)
    end
  end
end
