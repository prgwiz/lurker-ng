<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    version="1.0">

<xsl:output method="html" indent="yes" encoding="UTF-8"
    doctype-system="http://www.w3.org/TR/html4/strict.dtd"
    doctype-public="-//W3C//DTD HTML 4.01//EN"/>

<!-- Document Root -->
<xsl:template match="/">
<html>
 <head>
  <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
  <meta content="1;URL=splash/index.xml" http-equiv="Refresh"/>
  
  <title><xsl:value-of select="$support1"/></title>
 </head>
 <body>
  <p/><xsl:value-of select="$support2"/>
     <a href="splash/index.xml"><xsl:value-of select="$tryXML"/></a>
 </body>
</html>
</xsl:template>

</xsl:stylesheet>
