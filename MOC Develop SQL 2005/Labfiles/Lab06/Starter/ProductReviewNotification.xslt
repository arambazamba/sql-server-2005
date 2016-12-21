<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="notifications">
	<html>
		<body>
			<xsl:apply-templates/>
			<i>Thank you for using SQL Server Notification Services.</i><br/><br/>
	</body>
	</html>
	</xsl:template>

	<xsl:template match="notification">
	    <p>A new review has been submitted for product <b><xsl:value-of select="ProductId" /></b> : <b><xsl:value-of select="ProductName" /></b>. </p>
		<p>The reviewer gave the product a rating of <b><xsl:value-of select="Rating" /></b>, and made the following comments:</p>
		<p><xsl:value-of select="Comments" /></p>
		<br/><br/>
	</xsl:template>
	
</xsl:stylesheet>

