<!doctype html>
<html class="no-js" lang="$ContentLocale">
    <head>
        <% base_tag %>
        <title><% if $MetaTitle %>$MetaTitle.XML<% else %>$Title.XML<% end_if %> | $SiteConfig.Title.XML</title>
        $MetaTags(false)
        <meta name="viewport" id="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=10.0,initial-scale=1.0" />
        <% if $RSSLink %>
        <link rel='alternate' type='application/rss+xml' title='RSS' href='$RSSLink'>
        <% end_if %>
        <link rel="stylesheet" href="$ThemeDir(watea)/dist/css/main.css">
        <% include Favicon %>
    </head>
    <body class="$ClassName">
        <header>
            <% include Header %>
            <% include MainNav %>
        </header>
        <main id="main" class="main">
            $Layout
        </main>
        <% include PageShowcase %>
        <footer class="footer-site">
            <% include Footer %>
        </footer>
        <% require javascript('resources/vendor/silverstripe/admin/thirdparty/jquery/jquery.js') %>
        <script src="{$ThemeDir}/dist/js/main.js"></script>
        <script src="$ThemeDir(watea)/dist/js/main.js"></script>
        <% if $SiteConfig.GACode %>
            <script>
                (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
                ga('create', '$SiteConfig.GACode', 'auto');
                ga('send', 'pageview');
            </script>
        <% end_if %>
        <script type="text/javascript">
          (function(w,d,t,u,n,s,e){w['SwiftypeObject']=n;w[n]=w[n]||function(){
          (w[n].q=w[n].q||[]).push(arguments);};s=d.createElement(t);
          e=d.getElementsByTagName(t)[0];s.async=1;s.src=u;e.parentNode.insertBefore(s,e);
          })(window,document,'script','//s.swiftypecdn.com/install/v2/st.js','_st');

          _st('install','7rbb6t5QVsK2V6BH3KSf','2.0.0');
        </script>
    </body>
</html>
