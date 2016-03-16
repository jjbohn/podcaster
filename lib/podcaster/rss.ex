
defmodule Podcaster.Rss do
	def fetch do
    {:ok, %{body: body}} = HTTPoison.get("https://simplecast.com/podcasts/1739/rss")

    body
  end

  def generate(episodes) do
    feed = """
    <rss xmlns:atom="http://www.w3.org/2005/Atom/" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" version="2.0">
      <channel>
        <atom:link rel="self" type="application/atom+xml" href="http://www.stateofdevelopmentpodcast.com/rss" title="MP3 Audio"/>
        <title>State of Development Podcast with John Bohn | Software Development | Programming | News</title>
        <generator>https://simplecast.com</generator>
        <description>Need to know what's going on in the world of software development? Join John as he takes you through the week's programming/software development news.</description>
        <copyright>© 2016 State of Development Podcast</copyright>
        <language>en-us</language>
        <pubDate>Sun, 13 Mar 2016 21:00:00 -0400</pubDate>
        <lastBuildDate>Sun, 13 Mar 2016 21:40:17 -0400</lastBuildDate>
        <link>http://www.stateofdevelopmentpodcast.com/</link>
        <image>
          <url>https://media.simplecast.com/podcast/image/1739/1456938272-artwork.jpg</url>
          <title>State of Development Podcast with John Bohn | Software Development | Programming | News</title>
          <link>http://www.stateofdevelopmentpodcast.com/</link>
        </image>
        <itunes:author>John Bohn | Software Developer</itunes:author>
        <itunes:image href="https://media.simplecast.com/podcast/image/1739/1456938272-artwork.jpg"/>
        <itunes:summary>Need to know what's going on in the world of software development? Join John as he takes you through the week's programming/software development news.</itunes:summary>
        <itunes:subtitle>Need to know what's going on in the world of software development.</itunes:subtitle>
        <itunes:explicit>no</itunes:explicit>
        <itunes:keywords>software development, ruby, javascript, bootcamp, programming, news</itunes:keywords>
        <itunes:owner>
          <itunes:name>John Bohn</itunes:name>
          <itunes:email>jjbohn@gmail.com</itunes:email>
        </itunes:owner>
        <itunes:category text="Technology">
          <itunes:category text="Tech News"/>
        </itunes:category>
        <itunes:category text="Technology"/>
        <itunes:category text="Other"/>
    """

    items = Enum.map(episodes, fn(e) ->
      """
      <item>
        <title><![CDATA[#{e.title}]]></title>
        <guid isPermaLink="false">#{e.guid}</guid>
        <link>http://www.stateofdevelopmentpodcast.com/3</link>
        <description>
        <![CDATA[
        #{e.description}
        ]]>
        </description>
        <content:encoded>
        <![CDATA[
        #{e.long_description}
        ]]>
        </content:encoded>
        <pubDate>Sun, 13 Mar 2016 21:00:00 -0400</pubDate>
        <author>John Bohn | Software Developer</author>
        <enclosure url="#{e.audio_url}" length="#{e.audio_file_size}" type="audio/mpeg"/>
        <itunes:author>John Bohn | Software Developer</itunes:author>
        <itunes:image href="https://media.simplecast.com/episode/image/29276/1457918388-artwork.jpg"/>
        <itunes:duration>#{e.duration}</itunes:duration>
        <itunes:summary>
        <![CDATA[
        #{e.description}
        ]]>
        </itunes:summary>
        <itunes:subtitle>
        <![CDATA[
        #{e.description}
        ]]>
        </itunes:subtitle>
        <itunes:keywords>
        #{e.keywords}
        </itunes:keywords>
        <itunes:explicit>no</itunes:explicit>
      </item>
      """
    end)
    |> Enum.join("")

    feed = feed <> items <> "</channel></rss>"
    feed
  end
end
