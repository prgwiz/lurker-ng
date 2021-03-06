<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:variable name="lang" select="/*/@xml:lang"/>
<xsl:variable name="localefile" select="concat($lang, '.xml')"/>
<xsl:variable name="isofile" select="translate($localefile, '-ABCDEFGHIJKLMNOPQRSTUVWXYZ', '')"/>

<xsl:variable name="langfile">
 <xsl:choose>
  <xsl:when test="document($localefile)/text"><xsl:value-of select="$localefile"/></xsl:when>
  <xsl:when test="document($isofile)/text"><xsl:value-of select="$isofile"/></xsl:when>
  <xsl:otherwise>en.xml</xsl:otherwise>
 </xsl:choose>
</xsl:variable>

<xsl:variable name="language" select="document($langfile)/text/@language"/>
<xsl:variable name="thread" select="document($langfile)/text/@thread"/>
<xsl:variable name="subject" select="document($langfile)/text/@subject"/>
<xsl:variable name="author" select="document($langfile)/text/@author"/>
<xsl:variable name="date" select="document($langfile)/text/@date"/>
<xsl:variable name="to" select="document($langfile)/text/@to"/>
<xsl:variable name="cc" select="document($langfile)/text/@cc"/>
<xsl:variable name="attachments" select="document($langfile)/text/@attachments"/>

<xsl:variable name="delete-message" select="document($langfile)/text/@delete-message"/>
<xsl:variable name="reply-to-message" select="document($langfile)/text/@reply-to-message"/>
<xsl:variable name="regarding-subject" select="document($langfile)/text/@regarding-subject"/>
<xsl:variable name="quote-open" select="document($langfile)/text/@quote-open"/>
<xsl:variable name="quote-middle" select="document($langfile)/text/@quote-middle"/>
<xsl:variable name="quote-close" select="document($langfile)/text/@quote-close"/>

<xsl:variable name="tree-context" select="document($langfile)/text/@tree-context"/>
<xsl:variable name="full-tree" select="document($langfile)/text/@full-tree"/>
<xsl:variable name="mail-appears-in" select="document($langfile)/text/@mail-appears-in"/>
<xsl:variable name="thread-appears-in" select="document($langfile)/text/@thread-appears-in"/>
<xsl:variable name="list-info" select="document($langfile)/text/@list-info"/>
<xsl:variable name="near-message" select="document($langfile)/text/@near-message"/>
<xsl:variable name="old-topics" select="document($langfile)/text/@old-topics"/>
<xsl:variable name="new-topics" select="document($langfile)/text/@new-topics"/>
<xsl:variable name="raw-email" select="document($langfile)/text/@raw-email"/>

<xsl:variable name="front-page" select="document($langfile)/text/@front-page"/>
<xsl:variable name="search-menu" select="document($langfile)/text/@search-menu"/>
<xsl:variable name="list" select="document($langfile)/text/@list"/>
<xsl:variable name="group" select="document($langfile)/text/@group"/>
<xsl:variable name="all-lists" select="document($langfile)/text/@all-lists"/>
<xsl:variable name="all-groups" select="document($langfile)/text/@all-groups"/>
<xsl:variable name="all-langs" select="document($langfile)/text/@all-langs"/>
<xsl:variable name="missing-lang" select="document($langfile)/text/@missing-lang"/>
<xsl:variable name="offline" select="document($langfile)/text/@offline"/>
<xsl:variable name="deleted-message" select="document($langfile)/text/@deleted-message"/>
<xsl:variable name="search-button" select="document($langfile)/text/@search-button"/>
<xsl:variable name="search-heading" select="document($langfile)/text/@search-heading"/>

<xsl:variable name="jump-to-date" select="document($langfile)/text/@jump-to-date"/>
<xsl:variable name="search-list" select="document($langfile)/text/@search-list"/>
<xsl:variable name="jump-button" select="document($langfile)/text/@jump-button"/>
<xsl:variable name="use-special-word-list" select="document($langfile)/text/@use-special-word-list"/>
<xsl:variable name="to-search-list" select="document($langfile)/text/@to-search-list"/>
<xsl:variable name="newest-messages" select="document($langfile)/text/@newest-messages"/>
<xsl:variable name="jump-group" select="document($langfile)/text/@jump-group"/>
<xsl:variable name="post-new" select="document($langfile)/text/@post-new"/>
<xsl:variable name="subscribe" select="document($langfile)/text/@subscribe"/>
<xsl:variable name="recent-poster" select="document($langfile)/text/@recent-poster"/>
<xsl:variable name="new-threads" select="document($langfile)/text/@new-threads"/>
<xsl:variable name="post-count" select="document($langfile)/text/@post-count"/>
<xsl:variable name="activity-chart" select="document($langfile)/text/@activity-chart"/>

<xsl:variable name="search-thread" select="document($langfile)/text/@search-thread"/>
<xsl:variable name="use-special-word-thread" select="document($langfile)/text/@use-special-word-thread"/>
<xsl:variable name="to-search-thread" select="document($langfile)/text/@to-search-thread"/>

<xsl:variable name="refine-search" select="document($langfile)/text/@refine-search"/>
<xsl:variable name="jump-search" select="document($langfile)/text/@jump-search"/>
<xsl:variable name="no-refine" select="document($langfile)/text/@no-refine"/>
<xsl:variable name="useful-prefixs" select="document($langfile)/text/@useful-prefixs"/>

<xsl:variable name="day-suffix" select="document($langfile)/text/@day-suffix"/>

<xsl:variable name="jan" select="document($langfile)/text/@jan"/>
<xsl:variable name="feb" select="document($langfile)/text/@feb"/>
<xsl:variable name="mar" select="document($langfile)/text/@mar"/>
<xsl:variable name="apr" select="document($langfile)/text/@apr"/>
<xsl:variable name="may" select="document($langfile)/text/@may"/>
<xsl:variable name="jun" select="document($langfile)/text/@jun"/>
<xsl:variable name="jul" select="document($langfile)/text/@jul"/>
<xsl:variable name="aug" select="document($langfile)/text/@aug"/>
<xsl:variable name="sep" select="document($langfile)/text/@sep"/>
<xsl:variable name="oct" select="document($langfile)/text/@oct"/>
<xsl:variable name="nov" select="document($langfile)/text/@nov"/>
<xsl:variable name="dec" select="document($langfile)/text/@dec"/>

<xsl:variable name="unknown-address" select="document($langfile)/text/@unknown-address"/>
<xsl:variable name="deleted-name" select="document($langfile)/text/@deleted-name"/>
<xsl:variable name="posted-at" select="document($langfile)/text/@posted-at"/>
<xsl:variable name="admin-by" select="document($langfile)/text/@admin-by"/>
<xsl:variable name="version" select="document($langfile)/text/@version"/>

</xsl:stylesheet>
