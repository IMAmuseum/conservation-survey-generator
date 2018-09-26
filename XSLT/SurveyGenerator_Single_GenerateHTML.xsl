<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="html"/>

    <!--
           HTML page template
     -->
    <xsl:template match="a">

<xsl:variable name="creator" select="r/m/mv[@c='CRECREATORREF_TAB']"/>
<xsl:variable name="accessionNo" select="r/m/mv[@c='TITACCESSIONNO']"/>
        
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Conservation Survey Report - <xsl:value-of select="r[1]/m/mv[@c='TITACCESSIONNO']"/></title>
        <style media="all">
            .ima-collection-survey-report table,
            .ima-collection-survey-report tr,
            .ima-collection-survey-report td,
            .ima-collection-survey-repory div{
            margin: 0px;
            padding: 0px;
            }
            
            .ima-collection-survey-report,
            .ima-collection-survey-report div{
            font-family: Tahoma, Verdana, Segoe, sans-serif;
            }
            
            @media print{
            .ima-collection-survey-report table,
            .ima-collection-survey-report .ima-collection-survey-metadata p{
            page-break-inside: avoid;
            }
            }
            
            .ima-collection-survey-report h2{
            font-size: 16px;
            padding: 2px;
            border-bottom: 1px solid #666;
            background-color: #BBB;
            }
            
            .ima-collection-survey-report .header{
            width: 100%;
            }
            
            .ima-collection-survey-report .header .logo{
            vertical-align: top;
            width: 200px;
            }
            
            .ima-collection-survey-report .header .logo img{
            width: 180px;
            height: 133px;
            }
            
            .ima-collection-survey-report .header .address{
            font-size: 12px;
            text-align: left;
            vertical-align: top;
            }
            
            .ima-collection-survey-report .header .art-image{
            padding-bottom: 10px;
            }
            
            .ima-collection-survey-report .header .art-image img{
            padding: 3px;
            border: 1px solid #666;
            max-width: 150px;
            max-height: 150px;
            }
            
            .ima-collection-survey-report .ima-collection-survey-admin-metadata strong{
            margin-right: 5px;
            padding: 0px;
            }

            .ima-collection-survey-report .ima-collection-survey-metadata{
            padding: 0px;
            }

            .ima-collection-survey-report .ima-collection-survey-metadata strong{
            display: block;
            text-indent: 2px;
            background-color: #DDD;
            }
            
            .ima-collection-survey-report .ima-collection-survey-metadata .collection_survey_priority strong,
            .ima-collection-survey-report .ima-collection-survey-metadata .collection_survey_condition strong,
            .ima-collection-survey-report .ima-collection-survey-metadata .collection_survey_loan_eligibility strong{
            display: block;
            float: left;
            width: 250px;
            text-align: right;
            background-color: #DDD;
            margin-right: 5px;
            padding-right: 2px;
            }
            
            .ima-collection-survey-report .ima-collection-survey-metadata .collection_survey_priority .priority,
            .ima-collection-survey-report .ima-collection-survey-metadata .collection_survey_condition .condition,
            .ima-collection-survey-report .ima-collection-survey-metadata .collection_survey_loan_eligibility .priority{
            width: 100px;
            height: 14px;
            display: block;
            text-indent: -9999px;
            overflow: hidden;
            }
            .ima-collection-survey-report .ima-collection-survey-metadata .collection_survey_priority .priority-none,
            .ima-collection-survey-report .ima-collection-survey-metadata .collection_survey_loan_eligibility .priority-none{
            background: url('https://discovernewfields.org/application/files/6315/3608/3503/nonelowmediumhigh.png') 0 0;
            }
            .ima-collection-survey-report .ima-collection-survey-metadata .collection_survey_priority .priority-low,
            .ima-collection-survey-report .ima-collection-survey-metadata .collection_survey_loan_eligibility .priority-low{
            background: url('https://discovernewfields.org/application/files/6315/3608/3503/nonelowmediumhigh.png') 0 -14px;
            }
            .ima-collection-survey-report .ima-collection-survey-metadata .collection_survey_priority .priority-medium,
            .ima-collection-survey-report .ima-collection-survey-metadata .collection_survey_loan_eligibility .priority-medium{
            background: url('https://discovernewfields.org/application/files/6315/3608/3503/nonelowmediumhigh.png') 0 -28px;
            }
            .ima-collection-survey-report .ima-collection-survey-metadata .collection_survey_priority .priority-high,
            .ima-collection-survey-report .ima-collection-survey-metadata .collection_survey_loan_eligibility .priority-high{
            background: url('https://discovernewfields.org/application/files/6315/3608/3503/nonelowmediumhigh.png') 0 -42px;
            }
            
            .ima-collection-survey-report .ima-collection-survey-metadata .collection_survey_condition .condition-poor{
            background: url('https://discovernewfields.org/application/files/4815/3608/3503/poorfairgood.png') 0 0;
            }
            .ima-collection-survey-report .ima-collection-survey-metadata .collection_survey_condition .condition-fair{
            background: url('https://discovernewfields.org/application/files/4815/3608/3503/poorfairgood.png') 0 -14px;
            }
            .ima-collection-survey-report .ima-collection-survey-metadata .collection_survey_condition .condition-good{
            background: url('https://discovernewfields.org/application/files/4815/3608/3503/poorfairgood.png') 0 -28px;
            }
            
            .ima-collection-survey-report .ima-collection-survey-metadata .flag-information-icon{
            float: left;
            }
            
            pre{
            font-family: Tahoma, Verdana, Segoe, sans-serif;
            font: normal 11px;
            white-space: pre-wrap;
            }
            
        </style>
    </head>

<xsl:for-each select="r">
    <body style="page-break-after: always">
        <div class="ima-collection-survey-report" xmlns="http://www.w3.org/1999/xhtml">
            <table class="header">
                <tbody>
                    <tr>
                        <td class="logo">
                            <img src="https://discovernewfields.org/application/files/2515/3608/3665/logo-ima-large.png"/>
                        </td>
                        <td class="address">
                            <p><strong>Conservation Department</strong><xsl:value-of disable-output-escaping="yes">&lt;br/&gt;</xsl:value-of>4000 Michigan Road<xsl:value-of disable-output-escaping="yes">&lt;br/&gt;</xsl:value-of>Indianapolis, IN 46208<xsl:value-of disable-output-escaping="yes">&lt;br/&gt;</xsl:value-of>t (317) 913-1331<xsl:value-of disable-output-escaping="yes">&lt;br/&gt;</xsl:value-of>f (317) 920-0399<xsl:value-of disable-output-escaping="yes">&lt;br/&gt;</xsl:value-of>https://www.discovernewfields.org</p>
                        </td>
                        <td class="art-image" align="right">
                            <xsl:element name="img">
                                <xsl:attribute name="src">https://digitalmedia.imamuseum.org/piction/<xsl:value-of select="o[1]/@u"/></xsl:attribute> 
                            </xsl:element>
                        </td>
                    </tr>
                </tbody>
            </table>
            
            <table width="100%">
                <tbody>
                    <tr>
                        <td width="49%" valign="top">
                            <div class="ima-art-metadata">
                                <h2>Objects(s):</h2>
                                <div class="ima-art-metadata-inner">
                                    <p><em><strong class="title"><xsl:value-of select="m/mv[@c='TITMAINTITLE']"/></strong></em><xsl:value-of disable-output-escaping="yes">&lt;br/&gt;</xsl:value-of>
                                        <xsl:if test="$creator != ''"><xsl:value-of disable-output-escaping="yes" select="replace($creator, '\|\|', '&lt;br/&gt;')"/><xsl:value-of disable-output-escaping="yes">&lt;br/&gt;</xsl:value-of></xsl:if>
                                        <xsl:if test="m/mv[@c='CREDATECREATED'] != ''"><xsl:value-of select="m/mv[@c='CREDATECREATED']"/><xsl:value-of disable-output-escaping="yes">&lt;br/&gt;</xsl:value-of></xsl:if>
                                        <xsl:if test="m/mv[@c='PHYCONVERTEDDIMS'] != ''"><xsl:value-of select="m/mv[@c='PHYCONVERTEDDIMS']"/><xsl:value-of disable-output-escaping="yes">&lt;br/&gt;</xsl:value-of></xsl:if>
                                        <xsl:if test="m/mv[@c='PHYMEDIUMANDSUPPORT'] != ''"><xsl:value-of select="m/mv[@c='PHYMEDIUMANDSUPPORT']"/><xsl:value-of disable-output-escaping="yes">&lt;br/&gt;</xsl:value-of></xsl:if>
                                        <xsl:value-of select="m/mv[@c='LOCCURRENTLOCATIONREF']"/><xsl:value-of disable-output-escaping="yes">&lt;br/&gt;</xsl:value-of>
                                        <xsl:value-of select="m/mv[@c='TITACCESSIONNO']"/><xsl:if test="starts-with($accessionNo, '2')"><xsl:text> (Previously </xsl:text><xsl:value-of select="m/mv[@c='CNUMBER']"/><xsl:text>)</xsl:text></xsl:if></p>
                                </div>
                            </div>
                        </td>
                        <td width="2%"></td>
                        <td width="49%" valign="top">
                            <div class="ima-collection-survey-admin-metadata">
                                <h2>Examined By:</h2>
                                <div class="ima-collection-survey-admin-metadata-inner">
                                    <p><strong>Author</strong><xsl:value-of select="m/mv[@c='AUTHOR']"/><xsl:value-of disable-output-escaping="yes">&lt;br/&gt;</xsl:value-of>
                                        <strong>Contributors</strong><xsl:value-of select="m/mv[@c='CONTRIBUTORS']"/><xsl:value-of disable-output-escaping="yes">&lt;br/&gt;</xsl:value-of>
                                        <strong>Created on</strong><xsl:value-of select="m/mv[@c='CREATED DATE']"/><xsl:value-of disable-output-escaping="yes">&lt;br/&gt;</xsl:value-of>
                                        <strong>Last modified on</strong><xsl:value-of select="m/mv[@c='MODIFIED DATE']"/></p>
                                    <div class="ima-collection-survey-metadata">
                                        <p class="exam_location"><PRE><strong>Location of Examination</strong><xsl:value-of select="m/mv[@c='LOCATION'][@i='SURVEY']"/></PRE>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            
            <xsl:if test="m/mv[@c='MARKS'] != ''">
            <div class="ima-collection-survey-metadata">
                <p class="structural_priority">
                    <PRE><strong>Distinguishing Marks</strong><xsl:value-of select="m/mv[@c='MARKS']"/></PRE>
                </p>
            </div>
            </xsl:if>
            
            <div class="ima-collection-survey-metadata">
                <h2>Condition Survey:</h2>
                <p class="collection_survey_priority structural_priority">
                    <xsl:choose>
                        <xsl:when test="m/mv[@c='STRUCTURAL PRIORITY'] = 'None'">
                    <strong>Structural Priority</strong><span class="priority priority-none">None</span>
                        </xsl:when>
                        <xsl:when test="m/mv[@c='STRUCTURAL PRIORITY'] = 'Low'">
                            <strong>Structural Priority</strong><span class="priority priority-low">Low</span>
                        </xsl:when>
                        <xsl:when test="m/mv[@c='STRUCTURAL PRIORITY'] = 'Medium'">
                            <strong>Structural Priority</strong><span class="priority priority-medium">Medium</span>
                        </xsl:when>
                        <xsl:otherwise>
                            <strong>Structural Priority</strong><span class="priority priority-high">High</span>
                        </xsl:otherwise>
                    </xsl:choose>
                </p>
                <p class="collection_survey_priority aesthetic_priority">
                    <xsl:choose>
                        <xsl:when test="m/mv[@c='AESTHETIC PRIORITY'] = 'None'">
                            <strong>Aesthetic Priority</strong><span class="priority priority-none">None</span>
                        </xsl:when>
                        <xsl:when test="m/mv[@c='AESTHETIC PRIORITY'] = 'Low'">
                            <strong>Aesthetic Priority</strong><span class="priority priority-low">Low</span>
                        </xsl:when>
                        <xsl:when test="m/mv[@c='AESTHETIC PRIORITY'] = 'Medium'">
                            <strong>Aesthetic Priority</strong><span class="priority priority-medium">Medium</span>
                        </xsl:when>
                        <xsl:otherwise>
                            <strong>Aesthetic Priority</strong><span class="priority priority-high">High</span>
                        </xsl:otherwise>
                    </xsl:choose>
                </p>
                <p class="collection_survey_condition storage_condition">
                    <xsl:choose>
                        <xsl:when test="m/mv[@c='CONDITIONS'] = 'Good'">
                            <strong>Storage/Display Conditions</strong><span class="condition condition-good">Good</span>
                        </xsl:when>
                        <xsl:when test="m/mv[@c='CONDITIONS'] = 'Good'">
                            <strong>Storage/Display Conditions</strong><span class="condition condition-fair">Fair</span>
                        </xsl:when>
                        <xsl:otherwise>
                            <strong>Storage/Display Conditions</strong><span class="condition condition-poor">Poor</span>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:value-of disable-output-escaping="yes">&lt;br/&gt;</xsl:value-of>
                </p>
                <xsl:if test="m/mv[@c='DESCRIPTION'][@c='SURVEY'] != ''">
                <p class="condition_description">
                    <PRE><strong>Description</strong><xsl:value-of select="m/mv[@c='DESCRIPTION'][@i='SURVEY']"/></PRE>
                </p>
                </xsl:if>
                <xsl:if test="m/mv[@c='GENERAL CONDITION'] != ''">
                <p class="condition_general">
                    <PRE><strong>Condition</strong><xsl:value-of select="m/mv[@c='GENERAL CONDITION']"/></PRE>
                </p>
                </xsl:if>
                <xsl:if test="m/mv[@c='MOUNT BASE CONDITION'] != ''">
                    <p class="mount">
                        <PRE><strong>Mount/Base</strong><xsl:value-of select="m/mv[@c='MOUNT BASE CONDITION']"/></PRE>
                    </p>
                </xsl:if>
                <xsl:if test="m/mv[@c='PRIMARY SUPPORT'] != ''">
                    <p class="support_primary">
                        <PRE><strong>Primary Support</strong><xsl:value-of select="m/mv[@c='PRIMARY SUPPORT']"/></PRE>
                    </p>
                </xsl:if>
                <xsl:if test="m/mv[@c='SECONDARY SUPPORT'] != ''">
                    <p class="support_secondary">
                        <PRE><strong>Secondary Support</strong><xsl:value-of select="m/mv[@c='SECONDARY SUPPORT']"/></PRE>
                    </p>
                </xsl:if>
                <xsl:if test="m/mv[@c='GROUND LAYER'] != ''">
                    <p class="ground">
                        <PRE><strong>Ground/Preparatory Layer</strong><xsl:value-of select="m/mv[@c='GROUND LAYER']"/></PRE>
                    </p>
                </xsl:if>
                <xsl:if test="m/mv[@c='MEDIA'] != ''">
                    <p class="media">
                        <PRE><strong>Media</strong><xsl:value-of select="m/mv[@c='MEDIA']"/></PRE>
                    </p>
                </xsl:if>
                <xsl:if test="m/mv[@c='SURFACE COATINGS'] != ''">
                    <p class="surface">
                        <PRE><strong>Surface Coatings</strong><xsl:value-of select="m/mv[@c='SURFACE COATINGS']"/></PRE>
                    </p>
                </xsl:if>
                <xsl:if test="m/mv[@c='TESTING'] != ''">
                    <p class="testing">
                        <PRE><strong>Testing</strong><xsl:value-of select="m/mv[@c='TESTING']"/></PRE>
                    </p>
                </xsl:if>
                <xsl:if test="m/mv[@c='TREATMENT REC'] != ''">
                    <p class="proposed_treatment">
                        <PRE><strong>Recommended Treatment</strong><xsl:value-of select="m/mv[@c='TREATMENT REC']"/></PRE>
                    </p>
                </xsl:if>
                <xsl:if test="m/mv[@c='TREATMENT REC TIME'] != ''">
                    <p class="proposed_treatment_time">
                        <PRE><strong>Recommended Treatment Time Estimate (hours)</strong><xsl:value-of select="m/mv[@c='TREATMENT REC TIME']"/></PRE>
                    </p>
                </xsl:if>
                <xsl:if test="m/mv[@c='REQ TREATMENT'] != ''">
                    <p class="required_treatment">
                        <PRE><strong>Required Treatment</strong><xsl:value-of select="m/mv[@c='REQ TREATMENT']"/></PRE>
                    </p>
                </xsl:if>
                <xsl:if test="m/mv[@c='REQ TREATMENT TIME'] != ''">
                    <p class="required_treatment_time">
                        <PRE><strong>Required Treatment Time Estimate (hours)</strong><xsl:value-of select="m/mv[@c='REQ TREATMENT TIME']"/></PRE>
                    </p>
                </xsl:if>
                <xsl:if test="m/mv[@c='RESULTS'] != ''">
                    <p class="anticipated_treatment_results">
                        <PRE><strong>Anticipated Treatment Results</strong><xsl:value-of select="m/mv[@c='RESULTS']"/></PRE>
                    </p>
                </xsl:if>
                <xsl:if test="m/mv[@c='NOTES'] != ''">
                    <p class="recommendations">
                        <PRE><strong>Recommendations/Notes</strong><xsl:value-of select="m/mv[@c='NOTES']"/></PRE>
                    </p>
                </xsl:if>
                <xsl:if test="m/mv[@c='TRAVEL RECS'] != ''">
                    <p class="travel_recommendations">
                        <PRE><strong>Travel Recommendations</strong><xsl:value-of select="m/mv[@c='TRAVEL RECS']"/></PRE>
                    </p>
                </xsl:if>
                <xsl:if test="m/mv[@c='LOAN ELIGIBILITY'] != ''">
                    <p class="loan_eligibility">
                        <PRE><strong>Loan Eligibility</strong><xsl:value-of select="m/mv[@c='LOAN ELIGIBILITY']"/></PRE>
                    </p>
                </xsl:if>
                <xsl:if test="m/mv[@c='OPTIMAL STORAGE'] != ''">
                    <p class="optimal_storage_parameters">
                        <PRE><strong>Optimal Storage Parameters</strong><xsl:value-of select="m/mv[@c='OPTIMAL STORAGE']"/></PRE>
                    </p>
                </xsl:if>
                <xsl:if test="m/mv[@c='OPTIMAL DISPLAY'] != ''">
                    <p class="optimal_display_parameters">
                        <PRE><strong>Optimal Display Parameters</strong><xsl:value-of select="m/mv[@c='OPTIMAL DISPLAY']"/></PRE>
                    </p>
                </xsl:if>
                <xsl:if test="m/mv[@c='FLAGS'] != ''">
                    <p class="flag_information">
                        <PRE><strong>Flag Information for Artwork</strong><xsl:value-of select="m/mv[@c='FLAGS']"/></PRE>
                    </p>
                </xsl:if>
                <xsl:if test="m/mv[@c='ADDITIONAL INFO'] != ''">
                    <p class="additional_information">
                        <PRE><strong>Additional Information and Corrections to the Collections Database</strong><xsl:value-of select="m/mv[@c='ADDITIONAL INFO']"/></PRE>
                    </p>
                </xsl:if>
            </div>
        </div>
    </body>
</xsl:for-each>
</html>
    </xsl:template>

</xsl:stylesheet>
