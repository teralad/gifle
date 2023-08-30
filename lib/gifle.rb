# frozen_string_literal: true

require_relative "gifle/version"
require 'streamio-ffmpeg'

module Gifle
  class Error < StandardError; end

  class Video
    def initialize(video_url)
      @video = FFMPEG::Movie.new(video_url)
    end

    def gif?
      puts "You are on the right place."
    end

    def create_gif(from_time="00:00:00", duration=3, output_path)
      output_path ||= 'output.gif'
      options = {
        seek_time: from_time,
        duration: duration,
        aspect: 1.33333,
        resolution: "320x240",
        frame_rate: 10,
        format: 'gif'
      }
      # Set the time range (in seconds)
      @video.transcode(output_path, options)
    end
  end

end
