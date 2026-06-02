#!/usr/bin/env ruby
#
# Check for changed posts and pages

Jekyll::Hooks.register :posts, :post_init do |post|

  commit_num = `git rev-list --count HEAD "#{ post.path }"`

  if commit_num.to_i > 0
    lastmod_date = `git log -1 --pretty="%ad" --date=iso "#{ post.path }"`
    post.data['last_modified_at'] = lastmod_date
  end

end

Jekyll::Hooks.register :pages, :post_init do |page|

  commit_num = `git rev-list --count HEAD "#{ page.path }"`

  if commit_num.to_i > 0
    lastmod_date = `git log -1 --pretty="%ad" --date=iso "#{ page.path }"`
    page.data['last_modified_at'] = lastmod_date
  end

end
