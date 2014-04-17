<?xml version="1.0"?>
<xsl:stylesheet
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
version="2.0">

<xsl:output method="html" indent="yes" name="html"/>

<xsl:template match="/">

<xsl:result-document href="EmployeeData.html" format="html">
  <html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>East Corp - Employee Database</title>
  </head>
  <body style="background-color:lightgrey;">
     <table border="1px" cellpadding="10px">
          <tr>
            <th colspan="12" style="font-size:1.5em;">East Corp - Employee Database</th>
          </tr>
          <tr>
            <th>Name</th>
            <th>East Corp Username</th>
            <th>Phone (Home)</th>
            <th>Phone (Cell)</th>
            <th>Phone (Office)</th>
            <th>Fax Number</th>
            <th>Date of Birth</th>
            <th>Current Hourly Rate</th>
            <th>Address (Home)</th>
            <th>Address (Office)</th>
            <th>Email (Personal)</th>
            <th>Email (Work)</th>
          </tr> 
     <xsl:for-each select="//Employee">
          <tr>
            <td style="white-space: nowrap;"><xsl:value-of select="concat(First, ' ', Last)" /></td>
            <td><xsl:value-of select="Username" /></td>
            <td><xsl:value-of select="Phone[@Type = 'Home']"/></td>
            <td><xsl:value-of select="Phone[@Type = 'Cell']"/></td>
            <td><xsl:value-of select="Phone[@Type = 'Office']"/></td>
            <xsl:choose>
                <xsl:when test="boolean(Fax)">
                    <td><xsl:value-of select="Fax"/></td>
                </xsl:when>
                <xsl:otherwise>
                   <td> No Fax </td>
                </xsl:otherwise>
            </xsl:choose>
            <td><xsl:value-of select="Birthdate" /></td>
            <td>$<xsl:value-of select="HourlyRate" /></td>
            <td style="white-space: nowrap;"><xsl:value-of select="Address[@Location = 'Home']"/></td>
            <td style="white-space: nowrap;"><xsl:value-of select="Address[@Location = 'Office']"/></td>
            <td><xsl:value-of select="Email[@Type = 'Personal']"/></td>
            <td><xsl:value-of select="Email[@Type = 'Work']"/></td>
          </tr>
        </xsl:for-each>
     </table>
  </body>
</html>
</xsl:result-document>

<xsl:result-document href="Emergency_Contact_List.html" format="html">
  <html>
  <head>
  <title>East Corp - Emergency Contact List</title>
  </head>
  <body style="background-color: white;">
      <table border="1px" cellpadding="5px">
         <tr>
           <th colspan="3" style="font-size:1.5em;">East Corp - Emergency Contact List</th>
         </tr>
         <tr>
           <th colspan="3">Managers</th>
         </tr>           
         <tr>
            <th>Name</th>
            <th>Home Phone</th>
            <th>Cell Phone</th>
          </tr>       
        <xsl:for-each select="//Employee[@Type = 'Manager']">
          <tr>
            <td><xsl:value-of select="concat(First, ' ', Last)"/></td>
            <td><xsl:value-of select="Phone[@Type = 'Home']"/></td>
            <td><xsl:value-of select="Phone[@Type = 'Cell']"/></td>
          </tr> 
       </xsl:for-each>
                <tr>
           <th colspan="3">Regular Employees</th>
         </tr>           
         <tr>
            <th>Name</th>
            <th>Home Phone</th>
            <th>Cell Phone</th>
          </tr>       
        <xsl:for-each select="//Employee[@Type = 'Regular']">
          <tr>
            <td><xsl:value-of select="concat(First, ' ', Last)"/></td>
            <td><xsl:value-of select="Phone[@Type = 'Home']"/></td>
            <td><xsl:value-of select="Phone[@Type = 'Cell']"/></td>
          </tr> 
       </xsl:for-each>
                <tr>
           <th colspan="3">Temporary Employees</th>
         </tr>           
         <tr>
            <th>Name</th>
            <th>Home Phone</th>
            <th>Cell Phone</th>
          </tr>       
        <xsl:for-each select="//Employee[@Type = 'Temporary']">
          <tr>
            <td><xsl:value-of select="concat(First, ' ', Last)"/></td>
            <td><xsl:value-of select="Phone[@Type = 'Home']"/></td>
            <td><xsl:value-of select="Phone[@Type = 'Cell']"/></td>
          </tr> 
       </xsl:for-each>
     </table>
   </body>
 </html>
</xsl:result-document>

</xsl:template>

</xsl:stylesheet>   