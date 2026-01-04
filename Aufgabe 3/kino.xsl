<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/KINO_FILM">
    <html lang="de">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

        <title>Kino Dresden - aktuelle Filme</title>

        <style type="text/css"><![CDATA[
            * {
              margin: 0;
              padding: 0;
              box-sizing: border-box;
            }
            
            body {
              font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
              background: #0a0e27;
              min-height: 100vh;
              padding: 40px 20px;
              position: relative;
              overflow-x: hidden;
            }
            
            body::before {
              content: '';
              position: fixed;
              top: 0;
              left: 0;
              width: 100%;
              height: 100%;
              background: 
                radial-gradient(circle at 20% 50%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
                radial-gradient(circle at 80% 80%, rgba(99, 102, 241, 0.3) 0%, transparent 50%),
                radial-gradient(circle at 40% 20%, rgba(168, 85, 247, 0.2) 0%, transparent 50%);
              pointer-events: none;
              animation: pulse 8s ease-in-out infinite;
            }
            
            @keyframes pulse {
              0%, 100% { opacity: 1; }
              50% { opacity: 0.7; }
            }
            
            .container {
              max-width: 1200px;
              margin: 0 auto;
            }
            
            h1 {
              text-align: center;
              color: #fff;
              font-size: 56px;
              margin-bottom: 60px;
              text-shadow: 0 0 20px rgba(99, 102, 241, 0.8), 0 0 40px rgba(168, 85, 247, 0.6);
              letter-spacing: 2px;
              font-weight: 700;
              text-transform: uppercase;
              position: relative;
              z-index: 1;
              animation: glow 3s ease-in-out infinite;
            }
            
            @keyframes glow {
              0%, 100% { text-shadow: 0 0 20px rgba(99, 102, 241, 0.8), 0 0 40px rgba(168, 85, 247, 0.6); }
              50% { text-shadow: 0 0 30px rgba(99, 102, 241, 1), 0 0 60px rgba(168, 85, 247, 0.8); }
            }
            
            .films-grid {
              display: grid;
              grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
              gap: 30px;
              padding: 0 10px;
            }
            
            .film {
              background: rgba(15, 23, 42, 0.8);
              backdrop-filter: blur(20px);
              padding: 30px;
              border-radius: 20px;
              box-shadow: 0 8px 32px rgba(0,0,0,0.4), 
                          inset 0 1px 0 rgba(255,255,255,0.1);
              transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
              position: relative;
              overflow: hidden;
              border: 1px solid rgba(99, 102, 241, 0.3);
            }
            
            .film::before {
              content: '';
              position: absolute;
              top: 0;
              left: 0;
              width: 100%;
              height: 100%;
              background: linear-gradient(135deg, rgba(99, 102, 241, 0.1) 0%, rgba(168, 85, 247, 0.1) 100%);
              opacity: 0;
              transition: opacity 0.4s ease;
            }
            
            .film::after {
              content: '';
              position: absolute;
              top: -2px;
              left: -2px;
              right: -2px;
              bottom: -2px;
              background: linear-gradient(45deg, #6366f1, #a855f7, #ec4899, #6366f1);
              border-radius: 20px;
              z-index: -1;
              opacity: 0;
              filter: blur(10px);
              transition: opacity 0.4s ease;
              background-size: 300% 300%;
              animation: gradientShift 6s ease infinite;
            }
            
            @keyframes gradientShift {
              0% { background-position: 0% 50%; }
              50% { background-position: 100% 50%; }
              100% { background-position: 0% 50%; }
            }
            
            .film:hover::before {
              opacity: 1;
            }
            
            .film:hover::after {
              opacity: 0.6;
            }
            
            .film:hover {
              transform: translateY(-10px) scale(1.02);
              box-shadow: 0 20px 60px rgba(99, 102, 241, 0.4),
                          inset 0 1px 0 rgba(255,255,255,0.2);
              border-color: rgba(99, 102, 241, 0.6);
            }
            
            .titel {
              font-size: 28px;
              font-weight: 700;
              margin-bottom: 12px;
              color: #f8fafc;
              line-height: 1.3;
              text-shadow: 0 2px 10px rgba(99, 102, 241, 0.5);
            }
            
            .regisseur {
              font-size: 16px;
              color: #a78bfa;
              margin-bottom: 20px;
              font-weight: 500;
              display: flex;
              align-items: center;
              gap: 8px;
            }
            
            .regisseur::before {
              content: '🎬';
              font-size: 18px;
              filter: drop-shadow(0 0 5px rgba(167, 139, 250, 0.6));
            }
            
            .details {
              display: flex;
              flex-direction: column;
              gap: 12px;
            }
            
            .details p {
              display: flex;
              align-items: center;
              justify-content: space-between;
              font-size: 15px;
              color: #cbd5e1;
              padding: 12px 16px;
              background: rgba(30, 41, 59, 0.5);
              border-radius: 12px;
              transition: all 0.3s ease;
              border: 1px solid rgba(99, 102, 241, 0.2);
              gap: 20px;
            }
            
            .details p:hover {
              background: rgba(30, 41, 59, 0.8);
              border-color: rgba(99, 102, 241, 0.5);
              transform: translateX(5px);
            }
            
            .details strong {
              color: #e2e8f0;
              font-weight: 600;
              min-width: 140px;
              display: flex;
              align-items: center;
              gap: 8px;
            }
            
            .genre::before { content: '🎭'; }
            .datum::before { content: '📅'; }
            .rating::before { content: '⭐'; }
            
            @media (max-width: 768px) {
              h1 {
                font-size: 36px;
                margin-bottom: 30px;
              }
              
              .films-grid {
                grid-template-columns: 1fr;
              }
              
              .film {
                padding: 25px;
              }
            }
          ]]></style>
          </head>

      <body>
        <div class="container">
        <h1>Aktuelle Filmeübersicht</h1>

        <div class="films-grid">
        <xsl:for-each select="film">
          <div class="film">
            <div class="titel"><xsl:value-of select="titel"/></div>

            <div class="regisseur">
             <xsl:value-of select="regisseur"/>
            </div>

            <div class="details">
              <p class="genre"><strong>Genre</strong> <xsl:value-of select="genre"/></p>
              <p class="datum"><strong>Erscheinungsdatum</strong> <xsl:value-of select="erscheinungsdatum"/></p>
              <p class="rating"><strong>Rating</strong> <xsl:value-of select="rating"/></p>
            </div>
          </div>
        </xsl:for-each>
        </div>
        </div>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
