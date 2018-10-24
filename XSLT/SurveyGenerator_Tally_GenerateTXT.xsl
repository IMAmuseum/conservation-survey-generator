<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">

    <xsl:output method="text"/>

    <xsl:template match="a">
<xsl:text>Structural Priority</xsl:text><xsl:text>&#xa;</xsl:text>
<xsl:for-each-group select="r" group-by="m/mv[@c='STRUCTURAL PRIORITY']">
    <xsl:value-of select="m/mv[@c='STRUCTURAL PRIORITY']"/>: <xsl:value-of select="count(current-group())"/><xsl:text>&#xa;</xsl:text>
</xsl:for-each-group>
<xsl:text>&#xa;</xsl:text>
<xsl:text>Aesthetic Priority</xsl:text><xsl:text>&#xa;</xsl:text>
        <xsl:for-each-group select="r" group-by="m/mv[@c='AESTHETIC PRIORITY']">
            <xsl:value-of select="m/mv[@c='AESTHETIC PRIORITY']"/>: <xsl:value-of select="count(current-group())"/><xsl:text>&#xa;</xsl:text>
        </xsl:for-each-group>
<xsl:text>&#xa;</xsl:text>
<xsl:text>Storage/Display Conditions</xsl:text><xsl:text>&#xa;</xsl:text>
        <xsl:for-each-group select="r" group-by="m/mv[@c='CONDITIONS']">
            <xsl:value-of select="m/mv[@c='CONDITIONS']"/>: <xsl:value-of select="count(current-group())"/><xsl:text>&#xa;</xsl:text>
        </xsl:for-each-group>
    </xsl:template>
    
</xsl:stylesheet>