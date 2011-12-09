<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xd="http://www.pnp-software.com/XSLTdoc" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="tei" version="2.0">
  <xsl:output doctype-public="-//W3C//DTD HTML 4.01 Strict//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd" encoding="utf-8" indent="yes" method="html" omit-xml-declaration="yes"></xsl:output>
  <xsl:template match="tei:TEI">
    <html>
      <head>
        <title>
          <xsl:value-of select="normalize-space(tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title)"></xsl:value-of>
        </title>
      </head>
      <body>
        <xsl:apply-templates></xsl:apply-templates>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="tei:body">
    <div class="tei">
      <xsl:apply-templates></xsl:apply-templates>
    </div>
  </xsl:template>
  <xsl:template match="tei:p">
    <p>
      <xsl:apply-templates></xsl:apply-templates>
    </p>
  </xsl:template>
  <xsl:template match="tei:date">
    <xsl:text> </xsl:text>
    <span class="date">
      <xsl:value-of select="normalize-space(.)"></xsl:value-of>
    </span>
    <xsl:text></xsl:text>
  </xsl:template>
  <xsl:template match="tei:forename">
    <xsl:text xml:space="preserve"> </xsl:text>
    <xsl:call-template name="hcOriginalText"></xsl:call-template>
    <xsl:text></xsl:text>
  </xsl:template>
  <xsl:template match="tei:surname">
    <xsl:text xml:space="preserve"> </xsl:text>
    <xsl:call-template name="hcOriginalText"></xsl:call-template>
    <xsl:choose>
      <xsl:when test="descendant::tei:reg"> (<a>
          <xsl:attribute name="class">search persName</xsl:attribute>
          <xsl:attribute name="target">_blank</xsl:attribute>
          <xsl:attribute name="href">http://www.islandlives.ca/islandora/solr/search/tei.surname%3A%22<xsl:value-of select="normalize-space(descendant::tei:reg)"></xsl:value-of>%22+AND+dc.type:collection/-</xsl:attribute>
          <xsl:value-of select="descendant::tei:reg"></xsl:value-of>
        </a>) </xsl:when>
      <xsl:when test="descendant::tei:corr"> (<a>
          <xsl:attribute name="class">search persName</xsl:attribute>
          <xsl:attribute name="target">_blank</xsl:attribute>
          <xsl:attribute name="href">http://www.islandlives.ca/islandora/solr/search/tei.surname%3A%22<xsl:value-of select="normalize-space(descendant::tei:corr)"></xsl:value-of>%22+AND+dc.type:collection/-</xsl:attribute>
          <xsl:value-of select="descendant::tei:corr"></xsl:value-of>
        </a>) </xsl:when>
      <xsl:when test="descendant::expan"> (<a>
          <xsl:attribute name="class">search persName</xsl:attribute>
          <xsl:attribute name="target">_blank</xsl:attribute>
          <xsl:attribute name="href">http://www.islandlives.ca/islandora/solr/search/tei.surname%3A%22<xsl:value-of select="normalize-space(descendant::tei:expan)"></xsl:value-of>%22+AND+dc.type:collection/-</xsl:attribute>
          <xsl:value-of select="descendant::tei:expan"></xsl:value-of>
        </a>) </xsl:when>
      <xsl:otherwise> (<a>
          <xsl:attribute name="class">search persName</xsl:attribute>
          <xsl:attribute name="target">_blank</xsl:attribute>
          <xsl:attribute name="href">http://www.islandlives.ca/islandora/solr/search/tei.surname%3A%22<xsl:value-of select="normalize-space(.)"></xsl:value-of>%22+AND+dc.type:collection/-</xsl:attribute>
          <xsl:value-of select="."></xsl:value-of>
        </a>) </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="tei:placeName/tei:settlement|tei:placeName/tei:region|tei:geog|tei:geogName">
    <xsl:call-template name="hcOriginalText"></xsl:call-template>
    <xsl:choose>
      <xsl:when test="descendant::tei:reg">
(<a>
          <xsl:attribute name="class">search placeName</xsl:attribute>
          <xsl:attribute name="target">_blank</xsl:attribute>
          <xsl:attribute name="href">http://www.islandlives.ca/islandora/solr/search/tei.placeName%3A%22<xsl:value-of select="normalize-space(descendant::tei:choice/tei:reg)"></xsl:value-of>%22+AND+dc.type:collection/-</xsl:attribute>
          <xsl:value-of select="descendant::tei:reg"></xsl:value-of>
        </a>)
      </xsl:when>
      <xsl:when test="descendant::tei:corr">
(<a>
          <xsl:attribute name="class">search placeName</xsl:attribute>
          <xsl:attribute name="target">_blank</xsl:attribute>
          <xsl:attribute name="href">http://www.islandlives.ca/islandora/solr/search/tei.placeName%3A%22<xsl:value-of select="normalize-space(descendant::tei:corr)"></xsl:value-of>%22+AND+dc.type:collection/-</xsl:attribute>
          <xsl:value-of select="descendant::tei:corr"></xsl:value-of>
        </a>)
      </xsl:when>
      <xsl:when test="descendant::tei:expan">
(<a>
          <xsl:attribute name="class">search placeName</xsl:attribute>
          <xsl:attribute name="target">_blank</xsl:attribute>
          <xsl:attribute name="href">http://www.islandlives.ca/islandora/solr/search/tei.placeName%3A%22<xsl:value-of select="normalize-space(descendant::tei:expan)"></xsl:value-of>%22+AND+dc.type:collection/-</xsl:attribute>
          <xsl:value-of select="descendant::tei:expan"></xsl:value-of>
        </a>)
      </xsl:when>
      <xsl:otherwise>
(<a>
          <xsl:attribute name="class">search placeName</xsl:attribute>
          <xsl:attribute name="target">_blank</xsl:attribute>
          <xsl:attribute name="href">http://www.islandlives.ca/islandora/solr/search/tei.placeName%3A%22<xsl:value-of select="normalize-space(.)"></xsl:value-of>%22+AND+dc.type:collection/-</xsl:attribute>
          <xsl:value-of select="."></xsl:value-of>
        </a>)
</xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="tei:orgName">
    <xsl:call-template name="hcOriginalText"></xsl:call-template>
    <xsl:choose>
      <xsl:when test="descendant::tei:reg">
(<a>
          <xsl:attribute name="class">search orgName</xsl:attribute>
          <xsl:attribute name="target">_blank</xsl:attribute>
          <xsl:attribute name="href">http://www.islandlives.ca/islandora/solr/search/tei.orgName%3A%22<xsl:value-of select="normalize-space(descendant::tei:choice/tei:reg)"></xsl:value-of>%22+AND+dc.type:collection/-</xsl:attribute>
          <xsl:value-of select="descendant::tei:reg"></xsl:value-of>
        </a>)
      </xsl:when>
      <xsl:when test="descendant::tei:corr">
(<a>
          <xsl:attribute name="class">search orgName</xsl:attribute>
          <xsl:attribute name="target">_blank</xsl:attribute>
          <xsl:attribute name="href">http://www.islandlives.ca/islandora/solr/search/tei.orgName%3A%22<xsl:value-of select="normalize-space(descendant::tei:corr)"></xsl:value-of>%22+AND+dc.type:collection/-</xsl:attribute>
          <xsl:value-of select="descendant::tei:corr"></xsl:value-of>
        </a>)
      </xsl:when>
      <xsl:when test="descendant::tei:expan">
(<a>
          <xsl:attribute name="class">search orgName</xsl:attribute>
          <xsl:attribute name="target">_blank</xsl:attribute>
          <xsl:attribute name="href">http://www.islandlives.ca/islandora/solr/search/tei.orgName%3A%22<xsl:value-of select="normalize-space(descendant::tei:expan)"></xsl:value-of>%22+AND+dc.type:collection/-</xsl:attribute>
          <xsl:value-of select="descendant::tei:expan"></xsl:value-of>
        </a>)
      </xsl:when>
      <xsl:otherwise>
(<a>
          <xsl:attribute name="class">search orgName</xsl:attribute>
          <xsl:attribute name="target">_blank</xsl:attribute>
          <xsl:attribute name="href">http://www.islandlives.ca/islandora/solr/search/tei.orgName%3A%22<xsl:value-of select="normalize-space(.)"></xsl:value-of>%22+AND+dc.type:collection/-</xsl:attribute>
          <xsl:value-of select="."></xsl:value-of>
        </a>)
</xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="hcOriginalText">
    <xsl:choose>
      <xsl:when test="descendant::tei:orig">
        <xsl:value-of select="descendant::tei:orig"></xsl:value-of>
      </xsl:when>
      <xsl:when test="descendant::tei:sic">
        <xsl:value-of select="descendant::tei:sic"></xsl:value-of>
      </xsl:when>
      <xsl:when test="descendant::tei:abbr">
        <xsl:value-of select="descendant::tei:abbr"></xsl:value-of>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="."></xsl:value-of>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="tei:ref|tei:xref">
    <span style="display:none">
      <xsl:value-of select="."></xsl:value-of>
    </span>
  </xsl:template>
  <xsl:template match="tei:lb">
    <br></br>
  </xsl:template>
  <xsl:template match="tei:geogName">
     <span style="color:green">
      <xsl:choose>
        <xsl:when test="descendant::tei:orig">
          <xsl:apply-templates></xsl:apply-templates>
        </xsl:when>
        <xsl:when test="descendant::tei:sic">
          <xsl:apply-templates></xsl:apply-templates>
        </xsl:when>
        <xsl:when test="descendant::tei:abbr">
          <xsl:apply-templates></xsl:apply-templates>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="."></xsl:value-of>
          <xsl:text></xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </span> 
  </xsl:template>
  <xsl:template match="tei:sic">
    <u>
      <xsl:value-of select="."></xsl:value-of>
    </u>
  </xsl:template>
  <xsl:template match="tei:corr">
    <xsl:value-of select="."></xsl:value-of>
  </xsl:template>
  <xsl:template match="tei:gap">
    [... gap ...]
  </xsl:template>
  <xsl:template match="tei:note">
    [Written in margins:] <xsl:value-of select="."></xsl:value-of>
  </xsl:template>
  <xsl:template match="tei:text//tei:unclear">  
    [<xsl:value-of select="."></xsl:value-of>]
  </xsl:template>
  <xsl:template match="tei:choice" name="choice">
    <xsl:choose>
      <xsl:when test="tei:orig and tei:reg">
        <xsl:apply-templates select="tei:orig"></xsl:apply-templates>
        <xsl:text> (</xsl:text>
        <xsl:apply-templates select="tei:reg"></xsl:apply-templates>
        <xsl:text>)</xsl:text>
      </xsl:when>
      <xsl:when test="tei:abbr and tei:expan">
        <xsl:apply-templates select="tei:abbr"></xsl:apply-templates>
        <xsl:text> (</xsl:text>
        <xsl:apply-templates select="tei:expan"></xsl:apply-templates>
        <xsl:text>)</xsl:text>
      </xsl:when>
      <xsl:when test="tei:sic and tei:corr">
        <xsl:apply-templates select="tei:sic"></xsl:apply-templates>
        <xsl:text> (</xsl:text>
        <xsl:apply-templates select="tei:corr"></xsl:apply-templates>
        <xsl:text>)</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates></xsl:apply-templates>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xd:doc>
    <xd:short>Process elements tei:space</xd:short>
    <xd:detail> </xd:detail>
  </xd:doc>
  <xsl:template match="tei:space">
    <xsl:choose>
      <xsl:when test="@quantity">
        <xsl:call-template name="space_loop">
          <xsl:with-param name="extent" select="@quantity"></xsl:with-param>
        </xsl:call-template>
        <xsl:apply-templates></xsl:apply-templates>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text> </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xd:doc>
    <xd:short>[html] </xd:short>
    <xd:param name="extent">extent</xd:param>
    <xd:detail> </xd:detail>
  </xd:doc>
  <xsl:template name="space_loop">
    <xsl:param name="extent"></xsl:param>
    <xsl:choose>
      <xsl:when test="$extent &lt; 1"></xsl:when>
      <xsl:otherwise>
        <xsl:text> </xsl:text>
        <xsl:variable name="newextent">
          <xsl:value-of select="$extent - 1"></xsl:value-of>
        </xsl:variable>
        <xsl:call-template name="space_loop">
          <xsl:with-param name="extent" select="$newextent"></xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="tei:teiHeader"></xsl:template>
</xsl:stylesheet>
