#!/usr/bin/env ruby
#
# Check for changed posts and pages

Jekyll::Hooks.register :posts, :post_init do |post|
  next unless File.exist?(post.path)

  commit_num = `git rev-list --count HEAD "#{ post.path }" 2>/dev/null`

  if commit_num.to_i > 0
    lastmod_date = `git log -1 --pretty="%ad" --date=iso "#{ post.path }" 2>/dev/null`
    post.data['last_modified_at'] = lastmod_date
  end

end

Jekyll::Hooks.register :pages, :post_init do |page|
  next unless File.exist?(page.path)

  commit_num = `git rev-list --count HEAD "#{ page.path }" 2>/dev/null`

  if commit_num.to_i > 0
    lastmod_date = `git log -1 --pretty="%ad" --date=iso "#{ page.path }" 2>/dev/null`
    page.data['last_modified_at'] = lastmod_date
  end

end
