<xsl:stylesheet xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:dm="http://azure.workflow.datamapper" xmlns:ef="http://azure.workflow.datamapper.extensions" exclude-result-prefixes="xsl xs math dm ef" version="3.0" expand-text="yes">
  <xsl:output indent="yes" media-type="text/xml" method="xml" />
  <xsl:template match="/">
    <xsl:apply-templates select="." mode="azure.workflow.datamapper" />
  </xsl:template>
  <xsl:template match="/" mode="azure.workflow.datamapper">
    <Employees>
      <xsl:for-each select="/Employees/Employee">
        <Employee>
          <EmployeeID>{ID}</EmployeeID>
          <FullName>{concat(FirstName, LastName)}</FullName>
          <Contact>
            <Email>{Email}</Email>
          </Contact>
          <Department>{Department}</Department>
        </Employee>
      </xsl:for-each>
    </Employees>
  </xsl:template>
</xsl:stylesheet>