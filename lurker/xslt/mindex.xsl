<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    version="1.0">

<xsl:template name="option-range">
 <xsl:param name="start"/>
 <xsl:param name="last"/>
 <xsl:param name="select"/>
 <xsl:element name="option">
  <xsl:attribute name="value"><xsl:value-of select="$start"/></xsl:attribute>
  <xsl:if test="$start = $select">
   <xsl:attribute name="selected">yes</xsl:attribute>
  </xsl:if>
  <xsl:value-of select="$start"/>
 </xsl:element>
 <xsl:if test="$start &lt; $last">
  <xsl:call-template name="option-range">
   <xsl:with-param name="start"> <xsl:value-of select="$start+1"/></xsl:with-param>
   <xsl:with-param name="last"> <xsl:value-of select="$last"/></xsl:with-param>
   <xsl:with-param name="select"><xsl:value-of select="$select"/> </xsl:with-param>
  </xsl:call-template>
 </xsl:if>
</xsl:template>

<xsl:template name="hour-range">
 <xsl:param name="start"/>
 <xsl:param name="select"/>
 <xsl:element name="option">
  <xsl:attribute name="value"><xsl:value-of select="$start"/></xsl:attribute>
  <xsl:if test="$start = $select">
   <xsl:attribute name="selected">yes</xsl:attribute>
  </xsl:if>
  <xsl:value-of select="$start"/>:00
 </xsl:element>
 <xsl:if test="$start &lt; 23">
  <xsl:call-template name="hour-range">
   <xsl:with-param name="start"> <xsl:value-of select="$start+1"/></xsl:with-param>
   <xsl:with-param name="select"><xsl:value-of select="$select"/> </xsl:with-param>
  </xsl:call-template>
 </xsl:if>
</xsl:template>

<xsl:template match="time">
 <form action="../lurker-jump.cgi">
  [ <b><xsl:value-of select="$jumpto"/></b>
  <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
  <input type="hidden" name="format" value="{$ext}"/>
  <input type="hidden" name="list" value="{../list/id}"/>
  <select name="hour">
   <xsl:call-template name="hour-range">
    <xsl:with-param name="start">0</xsl:with-param>
    <xsl:with-param name="select"><xsl:value-of select="hour"/></xsl:with-param>
   </xsl:call-template>
  </select>
  <select name="mday">
   <xsl:call-template name="option-range">
    <xsl:with-param name="start">1</xsl:with-param>
    <xsl:with-param name="last">31</xsl:with-param>
    <xsl:with-param name="select"><xsl:value-of select="mday"/></xsl:with-param>
   </xsl:call-template>
  </select>
  <select name="mon">
   <xsl:element name="option">
    <xsl:attribute name="value">1</xsl:attribute>
    <xsl:if test="mon = 1"><xsl:attribute name="selected">yes</xsl:attribute></xsl:if>
    <xsl:value-of select="$jan"/>
   </xsl:element>
   <xsl:element name="option">
    <xsl:attribute name="value">2</xsl:attribute>
    <xsl:if test="mon = 2"><xsl:attribute name="selected">yes</xsl:attribute></xsl:if>
    <xsl:value-of select="$feb"/>
   </xsl:element>
   <xsl:element name="option">
    <xsl:attribute name="value">3</xsl:attribute>
    <xsl:if test="mon = 3"><xsl:attribute name="selected">yes</xsl:attribute></xsl:if>
    <xsl:value-of select="$mar"/>
   </xsl:element>
   <xsl:element name="option">
    <xsl:attribute name="value">4</xsl:attribute>
    <xsl:if test="mon = 4"><xsl:attribute name="selected">yes</xsl:attribute></xsl:if>
    <xsl:value-of select="$apr"/>
   </xsl:element>
   <xsl:element name="option">
    <xsl:attribute name="value">5</xsl:attribute>
    <xsl:if test="mon = 5"><xsl:attribute name="selected">yes</xsl:attribute></xsl:if>
    <xsl:value-of select="$may"/>
   </xsl:element>
   <xsl:element name="option">
    <xsl:attribute name="value">6</xsl:attribute>
    <xsl:if test="mon = 6"><xsl:attribute name="selected">yes</xsl:attribute></xsl:if>
    <xsl:value-of select="$jun"/>
   </xsl:element>
   <xsl:element name="option">
    <xsl:attribute name="value">7</xsl:attribute>
    <xsl:if test="mon = 7"><xsl:attribute name="selected">yes</xsl:attribute></xsl:if>
    <xsl:value-of select="$jul"/>
   </xsl:element>
   <xsl:element name="option">
    <xsl:attribute name="value">8</xsl:attribute>
    <xsl:if test="mon = 8"><xsl:attribute name="selected">yes</xsl:attribute></xsl:if>
    <xsl:value-of select="$aug"/>
   </xsl:element>
   <xsl:element name="option">
    <xsl:attribute name="value">9</xsl:attribute>
    <xsl:if test="mon = 9"><xsl:attribute name="selected">yes</xsl:attribute></xsl:if>
    <xsl:value-of select="$sep"/>
   </xsl:element>
   <xsl:element name="option">
    <xsl:attribute name="value">10</xsl:attribute>
    <xsl:if test="mon = 10"><xsl:attribute name="selected">yes</xsl:attribute></xsl:if>
    <xsl:value-of select="$oct"/>
   </xsl:element>
   <xsl:element name="option">
    <xsl:attribute name="value">11</xsl:attribute>
    <xsl:if test="mon = 11"><xsl:attribute name="selected">yes</xsl:attribute></xsl:if>
    <xsl:value-of select="$nov"/>
   </xsl:element>
   <xsl:element name="option">
    <xsl:attribute name="value">12</xsl:attribute>
    <xsl:if test="mon = 12"><xsl:attribute name="selected">yes</xsl:attribute></xsl:if>
    <xsl:value-of select="$dec"/>
   </xsl:element>
  </select>
  <select name="year">
   <xsl:call-template name="option-range">
    <xsl:with-param name="start">1990</xsl:with-param>
    <xsl:with-param name="last">2002</xsl:with-param>
    <xsl:with-param name="select"><xsl:value-of select="year"/></xsl:with-param>
   </xsl:call-template>
  </select>
  <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
  <input type="submit" value="Go!"/> ]
 </form>
</xsl:template>

<xsl:template match="mindex" mode="title">
 <xsl:value-of select="list/email/@name"/> -
 <xsl:value-of select="$mess"/>
 <xsl:text> </xsl:text>
 <xsl:value-of select="offset"/>-<xsl:value-of select="string(number(offset)+count(summary)-1)"/>
</xsl:template>

<xsl:template match="mindex" mode="body">
 <h2>
  <xsl:if test="prev">
   <a href="{list/id}@0.{$ext}"><img alt="&lt;&lt;=" src="../imgs/first.png"/></a>
   <a href="{list/id}@{prev}.{$ext}"><img alt="&lt;-" src="../imgs/prev.png"/></a>
  </xsl:if>
  <xsl:if test="not(prev)">
   <img src="../imgs/a.png"/>
   <img src="../imgs/a.png"/>
  </xsl:if>
  <xsl:if test="next">
   <a href="{list/id}@{next}.{$ext}"><img alt="-&gt;" src="../imgs/next.png"/></a>
   <a href="../lurker-jump.cgi?list={list/id}&amp;year=2038&amp;format={$ext}"><img alt="=&gt;&gt;" src="../imgs/last.png"/></a>
  </xsl:if>
  <xsl:if test="not(next)">
   <img src="../imgs/a.png"/>
   <img src="../imgs/a.png"/>
  </xsl:if>

  <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>

  <xsl:apply-templates select="list/email"/> - <xsl:value-of select="$mess"/>
  <xsl:text> </xsl:text>
  <xsl:value-of select="offset"/>-<xsl:value-of select="string(number(offset)+count(summary)-1)"/>
 </h2>
 
 <div class="jumpto"><xsl:apply-templates select="time"/></div>

 <table width="100%" cellpadding="0" cellspacing="0" id="padded">
  <tr class="thRow">
   <th align="left"><xsl:value-of select="$subject"/></th>
   <th align="left"><xsl:value-of select="$author"/></th>
   <th align="left"><xsl:value-of select="$date"/></th></tr>
  <xsl:apply-templates select="summary"/>
 </table>

 <hr/>

 <form action="../lurker-search.cgi" id="smsearch">
  <input type="hidden" name="format" value="{$ext}"/>
  <input type="text"   name="query"  value="ml:{list/id} " class="longtext"/>
  <input type="submit" name="submit" value="{$search}!"/><br/>

  <xsl:value-of select="$useMl1"/>
  <b>ml:<xsl:value-of select="list/id"/></b>
  <xsl:value-of select="$useMl2"/>
 </form>
</xsl:template>

</xsl:stylesheet>
