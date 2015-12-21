require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://dealsunlimitedinc.com'
SitemapGenerator::Sitemap.create do
  add '/welcome', :changefreq => 'daily', :priority => 0.9
  add '/vehicles', :changefreq => 'daily', :priority => 0.9
  add '/testimonials', :changefreq => 'daily', :priority => 0.9
  add '/policy', :changefreq => 'daily', :priority => 0.9
  add '/welcome', :changefreq => 'daily', :priority => 0.9
  add '/contact', :changefreq => 'daily'

end
SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks