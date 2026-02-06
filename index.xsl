<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="html" encoding="UTF-8" indent="yes" doctype-system="about:legacy-compat"/>
  
  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title><xsl:value-of select="article/metadata/title"/></title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&amp;family=Crimson+Pro:wght@400;600&amp;display=swap" rel="stylesheet"/>
        <style>
          * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
          }
          
          :root {
            --primary-color: #2c3e50;
            --accent-color: #3498db;
            --accent-hover: #2980b9;
            --text-color: #2c3e50;
            --text-light: #666;
            --background: #ffffff;
            --background-subtle: #f8f9fa;
            --border-color: #e1e8ed;
            --shadow-sm: 0 2px 4px rgba(0,0,0,0.04);
            --shadow-md: 0 4px 12px rgba(0,0,0,0.08);
            --shadow-lg: 0 8px 24px rgba(0,0,0,0.12);
            --max-width: 720px;
            --gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
          }
          
          body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            line-height: 1.7;
            color: var(--text-color);
            background: var(--background-subtle);
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
          }
          
          .hero {
            background: var(--gradient);
            color: white;
            padding: 5rem 2rem 4rem;
            margin-bottom: 3rem;
            position: relative;
            overflow: hidden;
          }
          
          .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg width="100" height="100" xmlns="http://www.w3.org/2000/svg"><defs><pattern id="grid" width="100" height="100" patternUnits="userSpaceOnUse"><path d="M 100 0 L 0 0 0 100" fill="none" stroke="rgba(255,255,255,0.1)" stroke-width="1"/></pattern></defs><rect width="100%" height="100%" fill="url(%23grid)"/></svg>');
            opacity: 0.3;
          }
          
          .hero-content {
            max-width: var(--max-width);
            margin: 0 auto;
            position: relative;
            z-index: 1;
          }
          
          .hero h1 {
            font-family: 'Crimson Pro', Georgia, serif;
            font-size: 3rem;
            font-weight: 600;
            line-height: 1.2;
            margin-bottom: 1.5rem;
            letter-spacing: -0.02em;
          }
          
          .metadata {
            display: flex;
            flex-wrap: wrap;
            gap: 1.5rem;
            font-size: 0.95rem;
            opacity: 0.95;
          }
          
          .metadata-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
          }
          
          .metadata-item::before {
            content: '•';
            font-size: 1.2rem;
            opacity: 0.6;
          }
          
          .metadata-item:first-child::before {
            display: none;
          }
          
          .container {
            max-width: var(--max-width);
            margin: 0 auto;
            padding: 0 2rem 4rem;
          }
          
          .article-body {
            background: var(--background);
            padding: 3rem;
            border-radius: 12px;
            box-shadow: var(--shadow-md);
            margin-bottom: 2rem;
          }
          
          .section {
            margin-bottom: 3rem;
          }
          
          .section:last-child {
            margin-bottom: 0;
          }
          
          h2 {
            font-family: 'Crimson Pro', Georgia, serif;
            font-size: 2rem;
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 1.25rem;
            line-height: 1.3;
            letter-spacing: -0.01em;
          }
          
          h3 {
            font-size: 1.4rem;
            font-weight: 600;
            color: var(--primary-color);
            margin-top: 2rem;
            margin-bottom: 1rem;
            line-height: 1.4;
          }
          
          p {
            font-size: 1.05rem;
            line-height: 1.8;
            margin-bottom: 1.25rem;
            color: var(--text-color);
          }
          
          ul {
            margin: 1.5rem 0;
            padding-left: 0;
            list-style: none;
          }
          
          li {
            position: relative;
            padding-left: 2rem;
            margin-bottom: 1rem;
            font-size: 1.05rem;
            line-height: 1.7;
          }
          
          li::before {
            content: '→';
            position: absolute;
            left: 0;
            color: var(--accent-color);
            font-weight: 600;
          }
          
          strong, .strong {
            font-weight: 600;
            color: var(--primary-color);
          }
          
          code {
            font-family: 'SF Mono', 'Monaco', 'Inconsolata', 'Courier New', monospace;
            background: var(--background-subtle);
            padding: 0.2em 0.5em;
            border-radius: 4px;
            font-size: 0.9em;
            color: #c7254e;
            border: 1px solid var(--border-color);
          }
          
          .footer {
            background: var(--background);
            padding: 2rem 3rem;
            border-radius: 12px;
            box-shadow: var(--shadow-sm);
            border-left: 4px solid var(--accent-color);
            font-style: italic;
            color: var(--text-light);
          }
          
          .footer p {
            margin-bottom: 0;
          }
          
          /* Subtle animations */
          @keyframes fadeIn {
            from {
              opacity: 0;
              transform: translateY(20px);
            }
            to {
              opacity: 1;
              transform: translateY(0);
            }
          }
          
          .section {
            animation: fadeIn 0.6s ease-out;
          }
          
          /* Responsive design */
          @media (max-width: 768px) {
            .hero {
              padding: 3rem 1.5rem 2.5rem;
            }
            
            .hero h1 {
              font-size: 2rem;
            }
            
            .container {
              padding: 0 1.5rem 2rem;
            }
            
            .article-body {
              padding: 2rem 1.5rem;
            }
            
            h2 {
              font-size: 1.6rem;
            }
            
            h3 {
              font-size: 1.25rem;
            }
            
            p, li {
              font-size: 1rem;
            }
            
            .footer {
              padding: 1.5rem;
            }
          }
          
          /* Print styles */
          @media print {
            .hero {
              background: var(--primary-color);
              print-color-adjust: exact;
              -webkit-print-color-adjust: exact;
            }
            
            .article-body,
            .footer {
              box-shadow: none;
              border: 1px solid var(--border-color);
            }
          }
        </style>
      </head>
      <body>
        <header class="hero">
          <div class="hero-content">
            <h1><xsl:value-of select="article/metadata/title"/></h1>
            <div class="metadata">
              <div class="metadata-item">
                <span><xsl:value-of select="article/metadata/author"/></span>
              </div>
              <div class="metadata-item">
                <span><xsl:value-of select="article/metadata/date"/></span>
              </div>
              <div class="metadata-item">
                <span><xsl:value-of select="article/metadata/category"/></span>
              </div>
            </div>
          </div>
        </header>
        
        <main class="container">
          <article class="article-body">
            <xsl:apply-templates select="article/section"/>
          </article>
          
          <aside class="footer">
            <xsl:apply-templates select="article/footer/paragraph"/>
          </aside>
        </main>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="section">
    <section class="section">
      <xsl:if test="heading">
        <h2><xsl:value-of select="heading"/></h2>
      </xsl:if>
      <xsl:apply-templates select="paragraph | list | subsection"/>
    </section>
  </xsl:template>
  
  <xsl:template match="subsection">
    <div class="subsection">
      <xsl:if test="subheading">
        <h3><xsl:value-of select="subheading"/></h3>
      </xsl:if>
      <xsl:apply-templates select="paragraph | list"/>
    </div>
  </xsl:template>
  
  <xsl:template match="paragraph">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  <xsl:template match="list">
    <ul>
      <xsl:apply-templates select="item"/>
    </ul>
  </xsl:template>
  
  <xsl:template match="item">
    <li>
      <xsl:apply-templates/>
    </li>
  </xsl:template>
  
  <xsl:template match="strong">
    <strong><xsl:apply-templates/></strong>
  </xsl:template>
  
  <xsl:template match="code">
    <code><xsl:apply-templates/></code>
  </xsl:template>
  
</xsl:stylesheet>
