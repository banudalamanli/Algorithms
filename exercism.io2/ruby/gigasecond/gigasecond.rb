class Gigasecond
  VERSION = 1

  def self.from(time_now = Time.now, add_seconds = 10**9)
    time_now + add_seconds
  end
end
