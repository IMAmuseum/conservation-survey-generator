<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">

    <xsl:output method="text"/>

    <xsl:template match="a">
<xsl:text>Accession #&#x09;Title&#x09;Artist&#x09;Structural Priority&#x09;Aesthetic Priority&#x09;Storage Condition</xsl:text>
<xsl:for-each select="r">
    <xsl:sort select="substring-before(atom[@c='TITACCESSIONNO'], '.')" />
    <xsl:sort select="translate(substring-after(atom[@c='TITACCESSIONNO'], '.'), '-ABCDEFGHIJKLMNOPQRSTUVWXYZ', '')" data-type="number" />
    <xsl:choose>
        <xsl:when test="contains(m/mv[@c='CRECREATORREF_TAB'], 'Artist: Unknown')">
            <xsl:text>
</xsl:text><xsl:value-of select="m/mv[@c='TITACCESSIONNO']"/><xsl:text>&#x09;</xsl:text><xsl:value-of select="m/mv[@c='TITMAINTITLE']"/><xsl:text>&#x09;Unknown&#x09;</xsl:text><xsl:value-of select="m/mv[@c='STRUCTURAL PRIORITY']"/><xsl:text>&#x09;</xsl:text><xsl:value-of select="m/mv[@c='AESTHETIC PRIORITY']"/><xsl:text>&#x09;</xsl:text><xsl:value-of select="m/mv[@c='CONDITIONS']"/>            
        </xsl:when>
        <xsl:when test="not(m/mv[@c='CRECREATORREF_TAB']) and m/mv[@c='CRECREATIONNATIONALITY2_TAB'] != ''">
            <xsl:text>
</xsl:text><xsl:value-of select="m/mv[@c='TITACCESSIONNO']"/><xsl:text>&#x09;</xsl:text><xsl:value-of select="m/mv[@c='TITMAINTITLE']"/><xsl:text>&#x09;</xsl:text><xsl:value-of select="m/mv[@c='CRECREATIONNATIONALITY2_TAB']"/><xsl:text>&#x09;</xsl:text><xsl:value-of select="m/mv[@c='STRUCTURAL PRIORITY']"/><xsl:text>&#x09;</xsl:text><xsl:value-of select="m/mv[@c='AESTHETIC PRIORITY']"/><xsl:text>&#x09;</xsl:text><xsl:value-of select="m/mv[@c='CONDITIONS']"/>         
        </xsl:when>
        <xsl:otherwise>
<xsl:text>
</xsl:text><xsl:value-of select="m/mv[@c='TITACCESSIONNO']"/><xsl:text>&#x09;</xsl:text><xsl:value-of select="m/mv[@c='TITMAINTITLE']"/><xsl:text>&#x09;</xsl:text><xsl:value-of select="substring-before(substring-after(m/mv[@c='CRECREATORREF_TAB'], ': '), ' | ')"/><xsl:text>&#x09;</xsl:text><xsl:value-of select="m/mv[@c='STRUCTURAL PRIORITY']"/><xsl:text>&#x09;</xsl:text><xsl:value-of select="m/mv[@c='AESTHETIC PRIORITY']"/><xsl:text>&#x09;</xsl:text><xsl:value-of select="m/mv[@c='CONDITIONS']"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>