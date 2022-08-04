cat _site/sitemap.xml | grep "https://jamesg.blog" | awk -F/ '{ print $5 }' | uniq
