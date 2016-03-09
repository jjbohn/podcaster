import "phoenix_html";
import "bootstrap";
import $ from "jquery";

(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                         m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-74228439-1', 'auto');
ga('send', 'pageview');

$(".trk__subscribe-with-itunes").click(() => {
  ga("send", "event", ["Podcast"], ["Subscribe"], ["iTunes"])
});

$(".trk__subscribe-with-rss").click(() => {
  ga("send", "event", ["Podcast"], ["Subscribe"], ["RSS"])
});

$(".trk__subscribe-with-stitcher").click(() => {
  ga("send", "event", ["Podcast"], ["Subscribe"], ["Stitcher"])
});

$(".trk__follow-twitter").click(() => {
  ga("send", "event", ["Social"], ["Follow"], ["Twitter"])
});

$(".trk__follow-facebook").click(() => {
  ga("send", "event", ["Social"], ["Follow"], ["Facbook"])
});
