<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    version="1.0">
 
 <xsl:variable name="lang">de</xsl:variable>
 <xsl:variable name="adminby">Administriert von: </xsl:variable>
 <xsl:variable name="error">Bei ihrer Anfrage ist ein Fehler aufgetreten</xsl:variable>
 <xsl:variable name="redirect">Umadressieren</xsl:variable>
 <xsl:variable name="mredirect">Ihr Browser sollte folgende Adresse laden:</xsl:variable>
<!-- FIX ME TO GERMAN -->
 <xsl:variable name="support1">Your Browser Supports XSL</xsl:variable>
 <xsl:variable name="support2">Your web browser appears to support XSL.</xsl:variable>
 <xsl:variable name="tryXML">Try the XML version of our site.</xsl:variable>
<!-- end placeholders -->
 
 <xsl:variable name="someone">Jemand</xsl:variable>
 <xsl:variable name="post1"></xsl:variable>
 <xsl:variable name="post2">'s Nachricht vom</xsl:variable>
<!-- FIX ME TO GERMAN -->
 <xsl:variable name="unknown">Unknown</xsl:variable>
 <xsl:variable name="nodesc">No Description</xsl:variable>
<!-- end placeholders -->
 
 <xsl:variable name="subject">Betreff</xsl:variable>
 <xsl:variable name="date">Datum</xsl:variable>
 <xsl:variable name="author">Autor</xsl:variable>
 <xsl:variable name="to">An</xsl:variable>
 <xsl:variable name="cc">Kopie</xsl:variable>
 <xsl:variable name="irt">Antwort-Auf</xsl:variable>
 <xsl:variable name="fus">Beantwortet-Von</xsl:variable>
 <xsl:variable name="appearinmbox">Auffindbar im</xsl:variable>
 <xsl:variable name="mailbox">Briefkasten</xsl:variable>
 <xsl:variable name="mailboxof">von</xsl:variable>
 <xsl:variable name="appearinlist">In Liste</xsl:variable>
<!-- FIX ME TO GERMAN -->
 <xsl:variable name="theselists">these mailing lists</xsl:variable>
<!-- end placeholders -->
 <xsl:variable name="reply">antwort</xsl:variable>

<!-- FIX ME TO GERMAN -->
 <xsl:variable name="date1">&#32</xsl:variable>
 <xsl:variable name="date2">, </xsl:variable>
<!-- end placeholders -->

 <xsl:variable name="mess">Nachrichten</xsl:variable>
 <xsl:variable name="message">Nachricht</xsl:variable>
 <xsl:variable name="threads">Neues Diskussionsthema</xsl:variable>

 <xsl:variable name="splash">Hauptseite</xsl:variable>
 <xsl:variable name="threading">Diskussionsbaum</xsl:variable>
<!-- Possible FIXME ? -->
 <xsl:variable name="lists">Liste</xsl:variable>
<!--      end         -->
 <xsl:variable name="search">Suchen</xsl:variable>

 <xsl:variable name="all-da">Mon-So</xsl:variable>
 <xsl:variable name="sun">Sonntag</xsl:variable>
 <xsl:variable name="mon">Montag</xsl:variable>
 <xsl:variable name="tue">Dienstag</xsl:variable>
 <xsl:variable name="wed">Mittwoch</xsl:variable>
 <xsl:variable name="thu">Donnerstag</xsl:variable>
 <xsl:variable name="fri">Freitag</xsl:variable>
 <xsl:variable name="sat">Samstag</xsl:variable>

 <xsl:variable name="all-mo">Alle Monate</xsl:variable>
 <xsl:variable name="jan">Januar</xsl:variable>
 <xsl:variable name="feb">Februar</xsl:variable>
 <xsl:variable name="mar">MÃ¤rz</xsl:variable>
 <xsl:variable name="apr">April</xsl:variable>
 <xsl:variable name="may">Mai</xsl:variable>
 <xsl:variable name="jun">Juni</xsl:variable>
 <xsl:variable name="jul">Juli</xsl:variable>
 <xsl:variable name="aug">August</xsl:variable>
 <xsl:variable name="sep">September</xsl:variable>
 <xsl:variable name="oct">Oktober</xsl:variable>
 <xsl:variable name="nov">November</xsl:variable>
 <xsl:variable name="dec">Dezember</xsl:variable>

 <xsl:variable name="all-ye">Alle Jahre</xsl:variable>
 <xsl:variable name="all-li">Alle Mailinglisten</xsl:variable>
 <xsl:variable name="info">Mailinglisten-Infos</xsl:variable>

<!-- FIX ME TO GERMAN -->
 <xsl:variable name="jumpto">Jump to...</xsl:variable>
 <xsl:variable name="useMl1">Use the operator </xsl:variable>
 <xsl:variable name="useMl2"> to search within this list.</xsl:variable>
 <xsl:variable name="useTh1">Use the operator </xsl:variable>
 <xsl:variable name="useTh2"> to search within this thread.</xsl:variable>

 <xsl:variable name="malt">M</xsl:variable>

 <xsl:variable name="headdet">Header Detail</xsl:variable>
 <xsl:variable name="min">Minimal</xsl:variable>
 <xsl:variable name="norm">Normal</xsl:variable>
 <xsl:variable name="full">Complete</xsl:variable>
 <xsl:variable name="javas">requires Javascript</xsl:variable>
<!-- end placeholders -->
</xsl:stylesheet>