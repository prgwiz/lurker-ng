<?xml version="1.0" encoding="ISO-8859-1" standalone="yes"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"                    
    xmlns="http://www.w3.org/1999/xhtml"
    version="1.0">

<xsl:output method="html" indent="yes" encoding="ISO-8859-1"
    doctype-system="http://www.w3.org/TR/html4/strict.dtd"
    doctype-public="-//W3C//DTD HTML 4.01//EN"/>

<xsl:template match="email[@address]">
  <a href="mailto:{@address}">
    <xsl:if test="@name">&quot;<xsl:value-of select="@name"/>&quot;</xsl:if>
    &lt;<xsl:value-of select="@address"/>&gt;
  </a>
</xsl:template>

<xsl:template match="email">
  <xsl:if test="not(@name)">
    SomeOne
  </xsl:if>
  <xsl:value-of select="@name"/>
</xsl:template>

<xsl:template match="summary">
  <tr>
  <td><a href="../message/{id}.html"><xsl:value-of select="subject"/></a></td>
  <td><xsl:apply-templates select="email"/></td>
  <td><xsl:value-of select="time"/></td>
  </tr>
</xsl:template>

<!-- Document Root -->
<xsl:template match="/">
 <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
 <head>
  <title>
    Lurker@<xsl:value-of select="/mindex/list/name"/> -
    index <xsl:value-of select="/mindex/offset"/>
  </title>
 </head>
 <body>
  <h1>Lurker@<xsl:value-of select="/mindex/list/name"/>
      <xsl:if test="/mindex/list/address">
        &lt;
        <a href="mailto:{/mindex/list/address}">
         <xsl:value-of select="/mindex/list/address"/>
        </a>
        &gt;
      </xsl:if>
  </h1>

  <h2>Messages <xsl:value-of select="/mindex/offset"/>
      / <xsl:value-of select="/mindex/list/messages"/>
  
     <xsl:if test="/mindex/prev">
       <a href="{/mindex/list/id}@{/mindex/prev}.html">(&lt;&lt; prev)</a>
     </xsl:if>
     <xsl:if test="/mindex/next">
       <a href="{/mindex/list/id}@{/mindex/next}.html">(next &gt;&gt;)</a>
     </xsl:if>
  </h2>

  <table border="1">
    <tr><th align="left">Subject</th>
        <th align="left">Author</th>
        <th align="left">Timestamp</th></tr>
    <xsl:apply-templates select="/mindex/summary"/>
  </table>

 </body>
 </html>
</xsl:template>

</xsl:stylesheet>