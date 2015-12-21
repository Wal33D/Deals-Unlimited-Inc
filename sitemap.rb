require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://dealsunlimitedinc.com'
SitemapGenerator::Sitemap.create do
  add '/welcome', :changefreq => 'daily', :priority => 1
  add '/vehicles', :changefreq => 'daily', :priority => 0.9
  add '/testimonials', :changefreq => 'daily', :priority => 0.9
    add '/finance', :changefreq => 'daily'
    add '/directions', :changefreq => 'daily'
  add '/policy', :changefreq => 'daily', :priority => 0.6
  add '/contact', :changefreq => 'daily'

end
SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks