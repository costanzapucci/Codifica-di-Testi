<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="html" encoding="UTF-8" indent="yes"/>
<xsl:template match="/">
    <html>
        <head>
          <title>Prolusioni di F.De Saussure - Progetto di Codifica dei Testi</title>
          <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"></xsl:value-of>
          <link href="agcp.css" rel="stylesheet" type="text/css"/>
        </head>
        
        <body>
            <img id="background" src="immagini/pergamena.jpg"/>
            <header>
                <img id="tit_img" src = "immagini/titolo.png"/>
            </header>
            <nav id="navbar">
                <ul> 
                    <li><a href = "#Intro">INTRO</a></li>
                    <li><a href = "#Pagina8">PAG 8</a></li> 
                    <li><a href = "#Pagina9">PAG 9</a></li>
                    <li><a href = "#Info">INFO</a></li>
                </ul>
            </nav>

            <div class="container" id="Intro">
                <h3 id="introduzione">Informazioni e storia</h3>
                <p>Manoscritto ad opera di <b><xsl:value-of select="//tei:author[@xml:id='FDS']"></xsl:value-of></b>.</p>
                <xsl:value-of select="//tei:history"></xsl:value-of>
                <p>È possibile consultare il manoscritto codificato presso l'archivio online dell'<xsl:value-of select="//tei:publicationStmt/tei:publisher"></xsl:value-of>.</p>
                <p>FRUIZIONE:<xsl:value-of select="//tei:avaibility"></xsl:value-of></p>
            </div>
            <div>
                <h3>Materiale e supporto</h3>
                <p>MATERIALE E DIMENSIONE: <xsl:value-of select="//tei:supportDesc"></xsl:value-of></p>
                <p>CARATTERI: <xsl:value-of select="//tei:typeDesc"></xsl:value-of></p>
                <p>LUNGHEZZA: <xsl:value-of select="//tei:layoutDesc"></xsl:value-of></p>
            </div>
            <div>
                <h3>Collocazione</h3>
                <xsl:apply-templates select="//tei:settingDesc"/>
                <p>Identificativo: <xsl:value-of select="//tei:sourceDesc/tei:msDesc/tei:msIdentifier//tei:idno"/></p>
            </div>

            <div class="container-legenda">
                <h5>LEGENDA</h5>
                <p><li id="giallo">Elemento terminologico: GIALLO</li></p>
                <p><li id="blu">Francesismi: ARANCIONE</li></p>
                <p><li id="verde">Aggiunte: ROSSO</li></p>
            </div>

            <div class="container-p8" id="Pagina8">
                <div class="titolo"><h3>Pagina 8</h3></div>
                
                
                <div class="img-wrapper">
                    <xsl:element name="img">
                        <xsl:attribute name="src">
                            <xsl:value-of select="//tei:graphic[@xml:id='Pag8']/@url"/>
                        </xsl:attribute>
                        <xsl:attribute name="id">frontepag8</xsl:attribute>
                    </xsl:element>
                </div>
                <div class="trascrizione">
                    <xsl:apply-templates select="//tei:text//tei:div[@n = '8']"/>
                </div>  
            </div>
            <div class="traduzione">
            <h4>TRADUZIONE IN ITALIANO <button id ="pulsanteTraduzione">+</button></h4>
            <span id='testoTraduzione' class='hidden'><xsl:value-of select="//tei:text//tei:div[@n = '1']"></xsl:value-of></span>
            </div>
           
            
            

            <div class="container-p9" id="Pagina9">
                <div class="titolo"> <h3>Pagina 9</h3> </div>
                <div class="img-wrapper">
                    <xsl:element name="img">
                        <xsl:attribute name="src">
                            <xsl:value-of select="//tei:graphic[@xml:id='Pag9']/@url"/>
                        </xsl:attribute>
                        <xsl:attribute name="id">frontepag9</xsl:attribute>
                    </xsl:element>
                </div>
                <div class="trascrizione">
                    <xsl:apply-templates select="//tei:text//tei:div[@n = '9']"/>
                </div>
            </div>
            <div class="traduzione2">
            <h4>TRADUZIONE IN ITALIANO <button id ="pulsanteTraduzione2">+</button></h4>
            <span id='testoTraduzione2' class='hidden'><xsl:value-of select="//tei:text//tei:div[@n = '2']"></xsl:value-of></span>
            </div>
            
            <h3 id="elemTerm">Alcune parole chiave</h3>
            <div class="container-term">
                <xsl:apply-templates select="//tei:back/tei:list"/>
            </div>

            <div class="container-bibliog" id="Info">
                <h3 id="bibliografia">Bibliografia</h3>
                <xsl:apply-templates select="//tei:listBibl"/>
            </div>

            <div class="container-about">
                <h3 id="about">Riferimenti</h3>
                <xsl:apply-templates select="//tei:editionStmt"/>
                <p>Traduzione di: <xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:respStmt/tei:name[@xml:id='EF']"></xsl:value-of></p>
            </div>
            
        </body>
        <script src="prol.js"></script>
    </html>
</xsl:template>
<!-- Collocazione-->
<xsl:template match="tei:settingDesc">
    <p><xsl:value-of select="current()/tei:p"></xsl:value-of></p>
    <p>STATO: <xsl:value-of select="current()//tei:country"></xsl:value-of></p>
</xsl:template>
 
<!--Suddivisione righe-->
<xsl:template match="//tei:text/tei:body/tei:div/tei:ab/tei:lb">
    <xsl:for-each select="current()">
      <xsl:element name="ol">
        </xsl:element>
    </xsl:for-each>
</xsl:template>

<!--Terminologia--> 
<xsl:template match="//tei:back/tei:list/tei:label">
    <xsl:for-each select="current()/tei:term">
        <xsl:element name="ol">
         </xsl:element>
    </xsl:for-each>
</xsl:template>

<!--Colore elementi terminologici-->
<xsl:template match="//tei:term">
    <span class="elemTerm">
    <xsl:value-of select="."/></span>
</xsl:template>

<!--Colore parole da altre lingue-->
<xsl:template match="//tei:mentioned">
    <span class="menzioni">
    <xsl:value-of select="."/></span>
</xsl:template>

<!--Cancellazioni-->
<xsl:template match="//tei:del">
    <span class="cancellazioni">
    <xsl:value-of select="."/></span>
</xsl:template>

<!--Aggiunte-->
<xsl:template match="//tei:add">
    <span class="aggiunte">
    <xsl:value-of select="."/></span>
</xsl:template>

<!--Sostituzioni trascrizione-->
<xsl:template match="tei:choice">
    <xsl:element name="span">
        <xsl:attribute name="class">choice</xsl:attribute>
        <xsl:element name="span">
            <xsl:attribute name="class">sic</xsl:attribute>
            <xsl:value-of select="tei:sic" />
        </xsl:element>
        <xsl:element name="span">
            <xsl:attribute name="class">corr</xsl:attribute>
            <xsl:value-of select="tei:corr" />
        </xsl:element>
    </xsl:element>
</xsl:template>

<!--Abbreviazioni-->
<xsl:template match="tei:abbr">
    <span class="abbreviazioni">
    <xsl:value-of select="."/></span>
</xsl:template>

<!--Espansioni-->
<xsl:template match="tei:expan">
    <span class="espansioni">
    <xsl:value-of select="."/></span>
</xsl:template>

<!--Bibliografia-->
<xsl:template match="tei:listBibl">
    <xsl:for-each select="current()/tei:bibl">
      <xsl:element name="li">
        <xsl:for-each select="current()//tei:author">
          <xsl:element name="span">
              <xsl:for-each select="current()//tei:forename">
                <xsl:apply-templates />
              </xsl:for-each>
              <xsl:text> </xsl:text>
              <xsl:for-each select="current()//tei:surname">
              	<xsl:apply-templates />
              </xsl:for-each>
            </xsl:element>
          <xsl:text>, </xsl:text>
        </xsl:for-each>

        <xsl:element name="span">
          <xsl:element name="i">
            <xsl:for-each select="current()//tei:title">
              <xsl:apply-templates />
              <xsl:text>, </xsl:text>
            </xsl:for-each>
          </xsl:element>
        </xsl:element>

        <xsl:element name="span">
          <xsl:for-each select="current()//tei:pubPlace">
            <xsl:apply-templates />
            <xsl:text>- </xsl:text>
          </xsl:for-each>
        </xsl:element>

        <xsl:element name="span">
          <xsl:apply-templates select="current()//tei:date" />
          <xsl:text>. </xsl:text>
        </xsl:element>

      </xsl:element>
    </xsl:for-each>
  </xsl:template>

  <!--Riferimenti-->
  <xsl:template match="tei:editionStmt">
    <p><xsl:value-of select="current()/tei:edition"></xsl:value-of></p>
    <p>Progetto a cura di: <xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='AG']"></xsl:value-of> e <xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='CP']"></xsl:value-of></p>
    <p>Coordinato da: <xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='AMDG']"></xsl:value-of></p>
  </xsl:template>

   


</xsl:stylesheet>
