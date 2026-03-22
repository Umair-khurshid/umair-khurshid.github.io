<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html lang="en">
      <head>
        <title>XML Sitemap</title>
        <style>
          body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background: #f5f5f5;
            color: #333;
          }
          .container {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            overflow: hidden;
          }
          h1 {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            margin: 0;
            padding: 20px;
            font-size: 24px;
          }
          .stats {
            padding: 15px 20px;
            background: #f8f9fa;
            border-bottom: 1px solid #e9ecef;
            color: #6c757d;
          }
          table {
            width: 100%;
            border-collapse: collapse;
          }
          th {
            background: #f8f9fa;
            padding: 12px 15px;
            text-align: left;
            font-weight: 600;
            color: #495057;
            border-bottom: 2px solid #dee2e6;
          }
          td {
            padding: 12px 15px;
            border-bottom: 1px solid #e9ecef;
            vertical-align: top;
          }
          tr:hover {
            background: #f8f9fa;
          }
          .url {
            font-family: 'Courier New', monospace;
            font-size: 13px;
          }
          .url a {
            color: #667eea;
            text-decoration: none;
          }
          .url a:hover {
            text-decoration: underline;
          }
          .date {
            font-family: monospace;
            font-size: 13px;
            white-space: nowrap;
          }
          .badge {
            display: inline-block;
            padding: 2px 8px;
            background: #e9ecef;
            border-radius: 4px;
            font-size: 11px;
            font-weight: 600;
            color: #495057;
          }
          footer {
            padding: 15px 20px;
            background: #f8f9fa;
            text-align: center;
            font-size: 12px;
            color: #6c757d;
            border-top: 1px solid #e9ecef;
          }
          @media (max-width: 768px) {
            body { padding: 10px; }
            td, th { padding: 8px 10px; }
            .url { font-size: 11px; }
            .date { font-size: 11px; }
          }
        </style>
      </head>
      <body>
        <div class="container">
          <h1> XML Sitemap</h1>
          <div class="stats">
            Total URLs: <strong><xsl:value-of select="count(sitemap:urlset/sitemap:url)"/></strong>
          </div>
          <table>
            <thead>
              <tr>
                <th>URL</th>
                <th>Last Modified</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="sitemap:urlset/sitemap:url">
                <tr>
                  <td class="url">
                    <a href="{sitemap:loc}" target="_blank">
                      <xsl:value-of select="sitemap:loc"/>
                    </a>
                  </td>
                  <td class="date">
                    <xsl:choose>
                      <xsl:when test="sitemap:lastmod">
                        <xsl:value-of select="sitemap:lastmod"/>
                        <span class="badge">✓</span>
                      </xsl:when>
                      <xsl:otherwise>
                        <span style="color: #adb5bd;">Not specified</span>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
          <footer>
            Generated from sitemap.xml • <a href="https://www.sitemaps.org" target="_blank">About sitemaps.org</a>
          </footer>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
