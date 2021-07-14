SitemapGenerator::Sitemap.default_host = 'https://true-eds-16020.herokuapp.com/'
SitemapGenerator::Sitemap.sitemaps_host = "https://s3-ap-northeast-1.amazonaws.com/#{ENV['S3_BUCKET_NAME']}"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
  ENV['S3_BUCKET_NAME'],
  aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  aws_region: ENV['AWS_DEFAULT_REGION'],
)

SitemapGenerator::Sitemap.create do
  add searchs_new_path
  add tops_index_path
  add root_path
  add '/newthreads/delete/:id'
  add newthreads_search_path
  add tops_author_path
  add concerns_search_path
  add newthreads_path
  add new_newthread_path
  add '/newthreads/:id'
  add '/newthread/:id/posts'

end