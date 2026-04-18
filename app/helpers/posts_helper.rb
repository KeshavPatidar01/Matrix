module PostsHelper
  def youtube_id(url)
    regex = %r{
      (?:youtu\.be|youtube\.com/(?:watch\?v=|embed/|v/))
      ([\w-]{11})
    }x

    match = url.match(regex)
    match[1] if match
  end

  # app/helpers/posts_helper.rb


  def youtube_thumbnail(youtube_url, quality = :high)
    # Agar URL khali ya galat hai, to ek default image ya nil return karein
    return "https://via.placeholder.com/480x360.png?text=Invalid+Video" if youtube_url.blank?

    # Alag-alag YouTube URL formats se Video ID nikalne ki koshish
    video_id = if youtube_url.include?("watch?v=")
                 youtube_url.match(/v=([^&]+)/)[1]
    elsif youtube_url.include?("youtu.be/")
                 youtube_url.split("/").last.split("?").first
    elsif youtube_url.include?("/embed/")
                 youtube_url.split("/embed/").last.split("?").first
    elsif youtube_url.include?("/shorts/")
                 youtube_url.split("/shorts/").last.split("?").first
    end

    # Agar video ID nahi mili, to default image return karein
    return "https://via.placeholder.com/480x360.png?text=Invalid+URL" unless video_id

    # YouTube thumbnail URL banayein
    case quality
    when :max
      "https://img.youtube.com/vi/#{video_id}/maxresdefault.jpg"
    when :high
      "https://img.youtube.com/vi/#{video_id}/hqdefault.jpg"
    when :medium
      "https://img.youtube.com/vi/#{video_id}/mqdefault.jpg"
    else
      "https://img.youtube.com/vi/#{video_id}/default.jpg"
    end
  end

   def youtube_embed_url(youtube_url)
    # Agar URL khali hai to aage na badhein
    return if youtube_url.blank?

    # Alag-alag tarah ke YouTube links se Video ID nikalna
    if youtube_url.include?("watch?v=")
      # Standard link: https://www.youtube.com/watch?v=XNDOqznkZ4Y
      video_id = youtube_url.split("v=").last.split("&").first
    elsif youtube_url.include?("youtu.be/")
      # Short link: https://youtu.be/XNDOqznkZ4Y
      video_id = youtube_url.split("/").last
    else
      # Agar format ajeeb hai to URL waisa hi rakhein
      return youtube_url
    end

    # Sahi embed URL banakar wapas bhejna
    "https://www.youtube.com/embed/#{video_id}"
  end
end
