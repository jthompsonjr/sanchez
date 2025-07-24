<?xml version="1.0"?>
<xsl:stylesheet id="quotes"
					xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
					version="1.0"
					xmlns:dc="http://purl.org/dc/elements/1.1/"
					exclude-result-prefixes='dc'
					xmlns:redirect="http://xml.apache.org/xalan/redirect"
					extension-element-prefixes="redirect">

<xsl:strip-space elements="*"/>
<xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" doctype-system="http://www.w3.org/TR/REC-html40/loose.dtd"/>

	<xsl:template match="/">
		<xsl:call-template name="main"/>
	</xsl:template>

	<xsl:template name="main">
		<xsl:for-each select="//record">
			<xsl:variable name="cn">
				<xsl:value-of select="cn" />
			</xsl:variable>
		<redirect:write select="concat('/home/dcoll/htdocs/lib-sanchez/raw/', $cn, '.html')">
		<html>
			<xsl:call-template name="httop"/>

			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
			<body  vlink="#800000" link="#3E0000" bgcolor="#E8DABD">
			<xsl:text>&#10;</xsl:text>

			<xsl:call-template name="body" />
			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>

			<xsl:call-template name="footer" />
			<xsl:text>&#10;</xsl:text>

			</body>
		</html>


		</redirect:write>

		</xsl:for-each>
	</xsl:template>


<!-- call-template matches start here -->

	<xsl:template name="httop">
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;head&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;title&#62;</xsl:text>
			<xsl:value-of select="dc:title"/> 
			<xsl:text disable-output-escaping="yes">&#60;/title&#62;</xsl:text>
				<xsl:text>&#10;</xsl:text>
				<xsl:text disable-output-escaping="yes">&#60;link rel=stylesheet type="text/css" href="../sanchez.css"&#62;</xsl:text>
				<xsl:text>&#10;</xsl:text>
				<xsl:call-template name="metadata"/>
				<xsl:text disable-output-escaping="yes">&#60;/head&#62;</xsl:text>
			<!-- END HEAD -->

	</xsl:template>
				
	
	<xsl:template name="metadata">

		<xsl:element name="META">
			<xsl:attribute name="NAME">DC.Subject</xsl:attribute>
 			<xsl:attribute name="CONTENT">
       				<xsl:call-template name="subjects"/>
  			</xsl:attribute>
 		</xsl:element>

		<xsl:element name="META">
			<xsl:attribute name="NAME">DC.Title</xsl:attribute>
 			<xsl:attribute name="CONTENT">
		 		<xsl:value-of select="normalize-space(dc:title)"/>
 			</xsl:attribute>
 		</xsl:element>

		<xsl:element name="META">
			<xsl:attribute name="NAME">DC.Source.Description</xsl:attribute>
 			<xsl:attribute name="CONTENT">
		 		<xsl:call-template name="sourcedescription"/>
 			</xsl:attribute>
 		</xsl:element>

		<xsl:element name="META">
			<xsl:attribute name="NAME">DC.Source.Date</xsl:attribute>
 			<xsl:attribute name="CONTENT">
		 		<xsl:value-of select="dc:sourcedate"/>
 			</xsl:attribute>
 		</xsl:element>
 		
 	 	<xsl:element name="META">
			<xsl:attribute name="NAME">DC.Coverage.Placename</xsl:attribute>
 			<xsl:attribute name="CONTENT">
				<xsl:call-template name="location"/>
 			</xsl:attribute>
 		</xsl:element>
 		
		<xsl:element name="META">
			<xsl:attribute name="NAME">DC.Description</xsl:attribute>
 			<xsl:attribute name="CONTENT">
				<xsl:call-template name="annotation"/>
 			</xsl:attribute>
 		</xsl:element>
		<xsl:text>&#10;</xsl:text>
 		
		<!-- END METADATA -->
	
	</xsl:template>


	<xsl:template name="body">
    	
		<xsl:text>&#10;</xsl:text>
		<xsl:comment> UT Logo </xsl:comment>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;div align="left"&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;A href="#endsearch"&#62;&#60;IMG alt="skip to content" src="../images/spacer.gif" width="1" height="1" border="0"&#62;&#60;/A&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;a href="http://www.utexas.edu"&#62;&#60;img src="../images/ut_top.gif" border="0" alt="The University of Texas at Austin"&#62;&#60;/a&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;/div&#62;</xsl:text>

		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;div align="center"&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;table width="90%" border="0" cellspacing="10" cellpadding="10"&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;tr&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;td colspan="2" align="center"&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;a href="../index.html"&#62;</xsl:text>

		<xsl:text disable-output-escaping="yes">&#60;img src="../images/title.gif" width="428" height="53" border="0" alt="Digitization of the Photographs from the George I S</xsl:text>
		<xsl:text>&#xE1;</xsl:text>
		<xsl:text disable-output-escaping="yes">nchez Papers"&#62;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;/a&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>	
		<xsl:text disable-output-escaping="yes">&#60;/td&#62;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;/tr&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;tr&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;td width="20%" valign="top"&#62;</xsl:text>
		
	
		<!-- Search area -->
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:comment> Search </xsl:comment>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;?php include("../search.php") ?&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:comment> /Search </xsl:comment>
		<!-- /Search area -->
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;/td&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>

		<xsl:text disable-output-escaping="yes">&#60;td valign="top" align="left"&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;a href="../r/</xsl:text>
		<xsl:value-of select="concat(cn, '.jpg')" />
		<xsl:text disable-output-escaping="yes">"&#62;&#60;img src="../t/</xsl:text>
		<xsl:value-of select="concat(cn, '.jpg')" />
		<xsl:text disable-output-escaping="yes">" border="1" alt="</xsl:text>
		<xsl:value-of select="dc:title" />
		<xsl:text disable-output-escaping="yes">" align="left"&#62;&#60;/a&#62;</xsl:text>

		<xsl:text>&#10;</xsl:text>
		<br clear="all" />
		<xsl:text>&#10;</xsl:text>

		<p><b><xsl:value-of select="dc:title" /></b></p>

		<xsl:text>&#10;</xsl:text>

		<p><b><xsl:text>date</xsl:text></b><br /><xsl:value-of select="dc:sourcedate" /></p>

		<xsl:text>&#10;</xsl:text>
		<p><b><xsl:text>medium</xsl:text></b><br /><xsl:call-template name="sourcedescription" /></p>

		<xsl:text>&#10;</xsl:text>
		<p><b><xsl:text>annotation</xsl:text></b><br /><xsl:call-template name="annotation" /></p>

		<xsl:text>&#10;</xsl:text>
		<p><b><xsl:text>subjects</xsl:text></b><br /><xsl:call-template name="subjects" /></p>

		<xsl:text>&#10;</xsl:text>
		<p><b><xsl:text>location</xsl:text></b><br /><xsl:call-template name="location" /></p>

		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;/td&#62;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;/tr&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;/table&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;/div&#62;</xsl:text>

</xsl:template>


<xsl:template name="footer">

		<xsl:comment> Footer </xsl:comment>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;div align="center"&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<p>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;table width="602" border="0" cellpadding="0" cellspacing="0" align="center"&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;tr&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;td&#62;</xsl:text>	
		<xsl:text disable-output-escaping="yes">&#60;img src="../images/space.gif" alt="" width="10" height="4" border="0"&#62;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;/td&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;td&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;font size="-1"&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#x00A9;</xsl:text>
		<xsl:text disable-output-escaping="yes"> &#60;a href="http://www.lib.utexas.edu"&#62;</xsl:text>
		<xsl:text>University of Texas Libraries</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;/a&#62;</xsl:text>
		<xsl:text> at </xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;a href="http://www.utexas.edu/"&#62;</xsl:text>
		<xsl:text>The University of Texas at Austin</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;/a&#62;</xsl:text>
		<xsl:text>.</xsl:text>
		<br />

		<xsl:text>&#10;</xsl:text>
		<xsl:text>Page Viewed: </xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;? print (date ("F j, Y")); ?&#62;</xsl:text>
		<xsl:text> &#160;</xsl:text>
		<xsl:text> &#160;</xsl:text>
		<xsl:text> Page Last Modified: </xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;? echo date("F j, Y", getlastmod()); ?&#62;</xsl:text> 
		<br />

		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;a href="http://www.lib.utexas.edu/comments.html"&#62;</xsl:text>
		<xsl:text>Comments</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;/a&#62;</xsl:text>
		<xsl:text> &#160;|&#160; </xsl:text>

		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;a href="http://www.lib.utexas.edu/usage_statement.html"&#62;</xsl:text>
		<xsl:text>Material usage statement</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;/a&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text> &#160;|&#160; </xsl:text>

		<xsl:text disable-output-escaping="yes">&#60;a href="http://www.utexas.edu/policies/privacy/"&#62;</xsl:text>
		<xsl:text>Privacy Information</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;/a&#62;</xsl:text>

		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;/font&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;/td&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>

		<xsl:text disable-output-escaping="yes">&#60;td&#62;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;a href="http://utopia.utexas.edu/"&#62;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;img src="../images/utopia_logo.gif" alt="UTOPIA" width="72" height="50" border="0" align="right"&#62;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;/a&#62;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;/td&#62;</xsl:text>

		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;/tr&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;/table&#62;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		
		</p>
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;/div&#62;</xsl:text>

		<xsl:text>&#10;</xsl:text>
		<xsl:comment> /Footer </xsl:comment>	
		<xsl:text>&#10;</xsl:text>

</xsl:template>

<!-- tag-template matches start here -->

	<xsl:template match="cn">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="urn">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="dc:title">
		<xsl:apply-templates />
	</xsl:template>
    
	<xsl:template match="dc:sourcetitle">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="dc:date">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="dc:creator">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="dc:rights">
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="dc:sourcedate">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template name="sourcedescription">
		<xsl:choose>
			<xsl:when test="string(dc:sourcedescription)">
				<xsl:value-of select="normalize-space(dc:sourcedescription)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>n/a</xsl:text>
			</xsl:otherwise>
		</xsl:choose>			
	</xsl:template>

	<xsl:template match="dc:type">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="dc:relationispartof">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template name="annotation">
		<xsl:choose>
			<xsl:when test="string(dc:descriptionannotation)">
				<xsl:value-of select="normalize-space(dc:descriptionannotation)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>n/a</xsl:text>
			</xsl:otherwise>
		</xsl:choose>			
	</xsl:template>

	<xsl:template name="location">
		<xsl:if test="dc:coverageplacenamecountry">
			<xsl:value-of select="dc:coverageplacenamecountry" />
		</xsl:if>
		<xsl:if test="dc:coverageplacenamestate">
			<xsl:text> -- </xsl:text>
			<xsl:value-of select="dc:coverageplacenamestate" />
		</xsl:if>
		<xsl:if test="dc:coverageplacenamecounty">
			<xsl:text> -- </xsl:text>
			<xsl:value-of select="dc:coverageplacenamecounty" />
		</xsl:if>
		<xsl:if test="string(dc:coverageplacenamecity)">
			<xsl:text> -- </xsl:text>
			<xsl:value-of select="dc:coverageplacenamecity" />
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="subjects">
		<xsl:apply-templates select="dc:subjectlcsh" />
		<xsl:if test="dc:subjectkeyword">
			<xsl:apply-templates select="dc:subjectkeyword" />
		</xsl:if>
	</xsl:template>

	<xsl:template match="dc:subjectlcsh">
		<xsl:if test="(preceding-sibling::dc:subjectlcsh)">
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:value-of select="." />
	</xsl:template>
	
	<xsl:template match="dc:subjectkeyword">
		<xsl:text>, </xsl:text>
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="dc:identifier">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="dc:identifierimageno">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="dc:publisher">
		<xsl:apply-templates />
	</xsl:template>

</xsl:stylesheet>
