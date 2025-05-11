<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:dm="http://azure.workflow.datamapper" xmlns:ef="http://azure.workflow.datamapper.extensions" xmlns="http://www.w3.org/2005/xpath-functions" exclude-result-prefixes="xsl xs math dm ef" version="3.0" expand-text="yes">
  <xsl:output indent="yes" media-type="text/json" method="text" omit-xml-declaration="yes" />
  <xsl:template match="/">
    <xsl:variable name="xmlinput" select="json-to-xml(/)" />
    <xsl:variable name="xmloutput">
      <xsl:apply-templates select="$xmlinput" mode="azure.workflow.datamapper" />
    </xsl:variable>
    <xsl:value-of select="xml-to-json($xmloutput,map{'indent':true()})" />
  </xsl:template>
  <xsl:template match="/" mode="azure.workflow.datamapper">
    <map>
      <array key="employees">
        <xsl:for-each select="/*/*[@key='employees']/*">
          <map>
            <xsl:choose>
              <xsl:when test="local-name-from-QName(node-name(*[@key='id'])) = 'null'">
                <null key="employeeId" />
              </xsl:when>
              <xsl:otherwise>
                <number key="employeeId">{*[@key='id']}</number>
              </xsl:otherwise>
            </xsl:choose>
            <string key="fullName">{concat(*[@key='firstName'], ' ', *[@key='lastName'])}</string>
            <map key="contact">
              <xsl:choose>
                <xsl:when test="local-name-from-QName(node-name(*[@key='email'])) = 'null'">
                  <null key="email" />
                </xsl:when>
                <xsl:otherwise>
                  <string key="email">{*[@key='email']}</string>
                </xsl:otherwise>
              </xsl:choose>
            </map>
            <xsl:choose>
              <xsl:when test="local-name-from-QName(node-name(*[@key='department'])) = 'null'">
                <null key="department" />
              </xsl:when>
              <xsl:otherwise>
                <string key="department">{*[@key='department']}</string>
              </xsl:otherwise>
            </xsl:choose>
          </map>
        </xsl:for-each>
      </array>
    </map>
  </xsl:template>
</xsl:stylesheet>