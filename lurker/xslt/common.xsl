<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    version="1.0">

<!-- Truncate long strings -->

<xsl:template name="truncate">
 <xsl:param name="string"/>
 <xsl:param name="length"/>
 <xsl:choose>
  <xsl:when test="string-length($string) &gt; $length">
   <xsl:value-of select="substring($string,1,$length-3)"/>
   <xsl:text>...</xsl:text>
  </xsl:when>
  <xsl:otherwise>
   <xsl:value-of select="$string"/>
  </xsl:otherwise>
 </xsl:choose>
</xsl:template>

<!-- Format email address -->

<xsl:template match="email[@address]">
 <a href="mailto:{@address}">
  <xsl:if test="@name">&quot;<xsl:value-of select="@name"/>&quot;</xsl:if>
  &lt;<xsl:value-of select="@address"/>&gt;
 </a>
</xsl:template>

<xsl:template match="email">
 <xsl:if test="not(@name)">
  Anonymous
 </xsl:if>
 <xsl:value-of select="@name"/>
</xsl:template>

<xsl:template match="email[@address]" mode="list">
  <xsl:if test="not(position()=1)"><xsl:text>, </xsl:text><br/></xsl:if>
  <xsl:apply-templates select="."/>
</xsl:template>

<!-- Format email message contents -->

<xsl:template match="mailto">
 <a class="mailto" href="mailto:{.}"><xsl:value-of select="."/></a>
</xsl:template>

<xsl:template match="url">
 <a class="url" href="{.}"><xsl:value-of select="."/></a>
</xsl:template>

<xsl:template match="quote">
 <i class="quote"><xsl:apply-templates/></i>
</xsl:template>

<xsl:template match="br"><br/></xsl:template>

<xsl:template match="mime">
 <div align="right">
  <xsl:if test="@name">
   <a href="../attach/{@id}@{/message/mid}@{@name}">
    <xsl:value-of select="@name"/> (<xsl:value-of select="@type"/>)
   </a>
   </xsl:if>
   <xsl:if test="not(@name)">
    <a href="../attach/{@id}@{/message/mid}.attach">
     (<xsl:value-of select="@type"/>)
    </a>
   </xsl:if>
  </div>
 <xsl:apply-templates/>
</xsl:template>

<!-- Format summary lists -->

<xsl:template match="a"><img alt="." src="i/a.png"/></xsl:template>
<xsl:template match="b"><img alt="|" src="i/b.png"/></xsl:template>
<xsl:template match="c"><img alt="-" src="i/c.png"/></xsl:template>
<xsl:template match="d"><img alt="\" src="i/d.png"/></xsl:template>
<xsl:template match="e"><img alt="+" src="i/e.png"/></xsl:template>
<xsl:template match="f"><a href="../message/{../../mid}.{$ext}"><img alt="M" border="0" src="i/f.png"/></a></xsl:template>
<xsl:template match="g"><a href="../message/{../../mid}.{$ext}"><img alt="M" border="0" src="i/g.png"/></a></xsl:template>
<xsl:template match="h"><a href="../message/{../../mid}.{$ext}"><img alt="M" border="0" src="i/h.png"/></a></xsl:template>
<xsl:template match="i"><a href="../message/{../../mid}.{$ext}"><img alt="M" border="0" src="i/i.png"/></a></xsl:template>
<xsl:template match="j"><a href="../message/{../../mid}.{$ext}"><img alt="M" border="0" src="i/j.png"/></a></xsl:template>
<xsl:template match="k"><a href="../message/{../../mid}.{$ext}"><img alt="M" border="0" src="i/k.png"/></a></xsl:template>

<xsl:template match="summary">
 <xsl:element name="tr">
  <xsl:if test="(position() mod 2) = 0">
   <xsl:attribute name="class">row1</xsl:attribute>
  </xsl:if>
  <xsl:if test="(position() mod 2) = 1">
   <xsl:attribute name="class">row2</xsl:attribute>
  </xsl:if>
  <td nowrap="1">
   <xsl:if test="draw"><xsl:apply-templates select="draw"/></xsl:if>
   <xsl:if test="not(draw)">
    <a href="../message/{mid}.{$ext}"><xsl:value-of select="subject"/></a>
   </xsl:if>
  </td>
  <td nowrap="1"><xsl:apply-templates select="email"/></td>
  <td nowrap="1"><xsl:value-of select="time"/></td>
 </xsl:element>
</xsl:template>

<xsl:template match="summary" mode="list">
  <xsl:if test="not(position()=1)"><xsl:text>, </xsl:text><br/></xsl:if>
  <a href="{mid}.{$ext}">
    <xsl:choose>
      <xsl:when test="email/@name"><xsl:value-of select="email/@name"/></xsl:when>
      <xsl:when test="email/@address"><xsl:value-of select="email/@address"/></xsl:when>
      <xsl:otherwise>SomeOne</xsl:otherwise>
    </xsl:choose>'s post on
    <xsl:value-of select="time"/>
  </a>
</xsl:template>

<!-- Format server information segments -->

<xsl:template match="server" mode="title">
  Lurker@<xsl:value-of select="hostname"/> 
</xsl:template>

<xsl:template match="server" mode="header">
 <h1><a href="../splash/index.{$ext}">
  Lurker@<xsl:value-of select="hostname"/>
 </a></h1>
</xsl:template>

<xsl:template match="server" mode="footer">
 <xsl:copy-of select="$adminby"/><xsl:apply-templates select="email"/>
</xsl:template>

</xsl:stylesheet>
