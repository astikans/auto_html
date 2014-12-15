AutoHtml.add_filter(:youtube).with(:width => 420, :height => 315, :frameborder => 0, :wmode => nil, :autoplay => false, :hide_related => false, :enable_js_api => false) do |text, options|
  regex = /(https?:\/\/)?(www.)?(youtube\.com\/watch\?v=|youtu\.be\/|youtube\.com\/watch\?feature=player_embedded&v=)([A-Za-z0-9_-]*)(\&\S+)?(\?\S+)?/
  text.gsub(regex) do
    youtube_id = $4
    width = options[:width]
    height = options[:height]
    frameborder = options[:frameborder]
		wmode = options[:wmode]
    autoplay = options[:autoplay]
    hide_related = options[:hide_related]
    enable_js_api = options[:enable_js_api]
		src = "//www.youtube.com/embed/#{youtube_id}"
    params = []
		params << "wmode=#{wmode}" if wmode
    params << "autoplay=1" if autoplay
    params << "rel=0" if hide_related
    params << "enablejsapi=1" if enable_js_api
    src += "?#{params.join '&'}" unless params.empty?
    %{<div class="video youtube"><iframe width="#{width}" height="#{height}" src="#{src}" allowfullscreen></iframe></div>}
  end
end
