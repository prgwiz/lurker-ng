<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    version="1.0">

<xsl:template match="thread" mode="title">
 <xsl:value-of select="summary/subject"/>
</xsl:template>

<xsl:template match="thread" mode="body">
 <h2>
  <xsl:value-of select="summary/subject"/>
 </h2>
 
 <table width="100%" cellspacing="0" cellpadding="0" id="threadOut">
  <tr class="thRow">
   <th align="left"><xsl:value-of select="$threading"/></th>
   <th align="left"><xsl:value-of select="$author"/></th>
   <th align="left"><xsl:value-of select="$date"/></th>
  </tr>
  <xsl:apply-templates select="summary"/>
 </table>

 <hr/>
 
 <form action="../lurker-search.cgi" id="smSearch">
  <input type="hidden" name="format" value="{$ext}"/>
  <input type="text"   name="query"  value="th:{id} " class="longtext"/>
  <input type="submit" name="submit" value="{$search}!"/>
  <br/>
  <xsl:value-of select="$useTh1"/>
  <b>th:<xsl:value-of select="id"/></b>
  <xsl:value-of select="$useTh2"/>
 </form> 
</xsl:template>

</xsl:stylesheet>
