<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<!-- Version 20091002 -->
<xsl:stylesheet version="1.0" com:dummy-for-xmlns="" pie:dummy-for-xmlns="" pip:dummy-for-xmlns="" pcp:dummy-for-xmlns="" pcm:dummy-for-xmlns="" main:dummy-for-xmlns="" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:com="http://rep.oio.dk/ubl/xml/schemas/0p71/common/" xmlns:pie="http://rep.oio.dk/ubl/xml/schemas/0p71/pie/" xmlns:pip="http://rep.oio.dk/ubl/xml/schemas/0p71/pip/" xmlns:pcp="http://rep.oio.dk/ubl/xml/schemas/0p71/pcp/" xmlns:pcm="http://rep.oio.dk/ubl/xml/schemas/0p71/pcm/" xmlns:main="http://rep.oio.dk/ubl/xml/schemas/0p71/maindoc/">
<xsl:output method="xml" />
<xsl:template match="*|@*" mode="schematron-get-full-path">
<xsl:apply-templates select="parent::*" mode="schematron-get-full-path" />
<xsl:text>/</xsl:text>
<xsl:if test="count(. | ../@*) = count(../@*)">@</xsl:if>
<xsl:value-of select="name()" />
<xsl:text>[</xsl:text>
<xsl:value-of select="1+count(preceding-sibling::*[name()=name(current())])" />
<xsl:text>]</xsl:text>
</xsl:template>
<xsl:template match="/">
<schematron>
<xsl:apply-templates select="/" mode="M7" /><xsl:apply-templates select="/" mode="M8" /><xsl:apply-templates select="/" mode="M9" /><xsl:apply-templates select="/" mode="M10" /><xsl:apply-templates select="/" mode="M11" /><xsl:apply-templates select="/" mode="M12" /><xsl:apply-templates select="/" mode="M13" /><xsl:apply-templates select="/" mode="M14" /><xsl:apply-templates select="/" mode="M15" /><xsl:apply-templates select="/" mode="M16" /><xsl:apply-templates select="/" mode="M17" /><xsl:apply-templates select="/" mode="M18" /><xsl:apply-templates select="/" mode="M19" /><xsl:apply-templates select="/" mode="M20" /><xsl:apply-templates select="/" mode="M21" /><xsl:apply-templates select="/" mode="M22" /><xsl:apply-templates select="/" mode="M23" /><xsl:apply-templates select="/" mode="M24" /><xsl:apply-templates select="/" mode="M25" /><xsl:apply-templates select="/" mode="M26" /><xsl:apply-templates select="/" mode="M27" /><xsl:apply-templates select="/" mode="M28" /><xsl:apply-templates select="/" mode="M29" /><xsl:apply-templates select="/" mode="M30" /><xsl:apply-templates select="/" mode="M31" /></schematron>
</xsl:template>
<xsl:template match="/pie:Invoice | pcm:Invoice" priority="4000" mode="M7">
<xsl:choose>
<xsl:when test="substring-before(translate(substring-after(namespace-uri(),'http://rep.oio.dk/ubl/xml/schemas/0p71/'),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ'),'/') = com:TypeCode" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>substring-before(translate(substring-after(namespace-uri(),'http://rep.oio.dk/ubl/xml/schemas/0p71/'),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ'),'/') = com:TypeCode</pattern>:
   The value of com:TypeCode under Invoice should be an uppercased equivalent to the lowercase value at the end of the namespace of the document element, thus if the namespace is http://rep.oio.dk/ubl/xml/schemas/0p71/pie the value of com:TypeCode should be PIE.
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="main:InvoiceCurrencyCode = &quot;AED&quot;  or main:InvoiceCurrencyCode = &quot;AFN&quot;  or main:InvoiceCurrencyCode = &quot;ALL&quot;  or main:InvoiceCurrencyCode = &quot;AMD&quot;  or main:InvoiceCurrencyCode = &quot;ANG&quot;  or main:InvoiceCurrencyCode = &quot;AOA&quot;  or main:InvoiceCurrencyCode = &quot;ARS&quot;  or main:InvoiceCurrencyCode = &quot;AUD&quot;  or main:InvoiceCurrencyCode = &quot;AWG&quot;  or main:InvoiceCurrencyCode = &quot;AZM&quot;  or main:InvoiceCurrencyCode = &quot;AZN&quot;  or main:InvoiceCurrencyCode = &quot;BAM&quot;  or main:InvoiceCurrencyCode = &quot;BBD&quot;  or main:InvoiceCurrencyCode = &quot;BDT&quot;  or main:InvoiceCurrencyCode = &quot;BGN&quot;  or main:InvoiceCurrencyCode = &quot;BHD&quot;  or main:InvoiceCurrencyCode = &quot;BIF&quot;  or main:InvoiceCurrencyCode = &quot;BMD&quot;  or main:InvoiceCurrencyCode = &quot;BND&quot;  or main:InvoiceCurrencyCode = &quot;BOB&quot;  or main:InvoiceCurrencyCode = &quot;BRL&quot;  or main:InvoiceCurrencyCode = &quot;BSD&quot;  or main:InvoiceCurrencyCode = &quot;BTN&quot;  or main:InvoiceCurrencyCode = &quot;BWP&quot;  or main:InvoiceCurrencyCode = &quot;BYR&quot;  or main:InvoiceCurrencyCode = &quot;BZD&quot;  or main:InvoiceCurrencyCode = &quot;CAD&quot;  or main:InvoiceCurrencyCode = &quot;CDF&quot;  or main:InvoiceCurrencyCode = &quot;CHF&quot;  or main:InvoiceCurrencyCode = &quot;CLP&quot;  or main:InvoiceCurrencyCode = &quot;CNY&quot;  or main:InvoiceCurrencyCode = &quot;COP&quot;  or main:InvoiceCurrencyCode = &quot;CRC&quot;  or main:InvoiceCurrencyCode = &quot;CSD&quot;  or main:InvoiceCurrencyCode = &quot;CUP&quot;  or main:InvoiceCurrencyCode = &quot;CVE&quot;  or main:InvoiceCurrencyCode = &quot;CYP&quot;  or main:InvoiceCurrencyCode = &quot;CZK&quot;  or main:InvoiceCurrencyCode = &quot;DJF&quot;  or main:InvoiceCurrencyCode = &quot;DKK&quot;  or main:InvoiceCurrencyCode = &quot;DOP&quot;  or main:InvoiceCurrencyCode = &quot;DZD&quot;  or main:InvoiceCurrencyCode = &quot;EEK&quot;  or main:InvoiceCurrencyCode = &quot;EGP&quot;  or main:InvoiceCurrencyCode = &quot;ERN&quot;  or main:InvoiceCurrencyCode = &quot;ETB&quot;  or main:InvoiceCurrencyCode = &quot;EUR&quot;  or main:InvoiceCurrencyCode = &quot;FJD&quot;  or main:InvoiceCurrencyCode = &quot;FKP&quot;  or main:InvoiceCurrencyCode = &quot;GBP&quot;  or main:InvoiceCurrencyCode = &quot;GEL&quot;  or main:InvoiceCurrencyCode = &quot;GGP&quot;  or main:InvoiceCurrencyCode = &quot;GHC&quot;  or main:InvoiceCurrencyCode = &quot;GIP&quot;  or main:InvoiceCurrencyCode = &quot;GMD&quot;  or main:InvoiceCurrencyCode = &quot;GNF&quot;  or main:InvoiceCurrencyCode = &quot;GTQ&quot;  or main:InvoiceCurrencyCode = &quot;GYD&quot;  or main:InvoiceCurrencyCode = &quot;HKD&quot;  or main:InvoiceCurrencyCode = &quot;HNL&quot;  or main:InvoiceCurrencyCode = &quot;HRK&quot;  or main:InvoiceCurrencyCode = &quot;HTG&quot;  or main:InvoiceCurrencyCode = &quot;HUF&quot;  or main:InvoiceCurrencyCode = &quot;IDR&quot;  or main:InvoiceCurrencyCode = &quot;ILS&quot;  or main:InvoiceCurrencyCode = &quot;IMP&quot;  or main:InvoiceCurrencyCode = &quot;INR&quot;  or main:InvoiceCurrencyCode = &quot;IQD&quot;  or main:InvoiceCurrencyCode = &quot;IRR&quot;  or main:InvoiceCurrencyCode = &quot;ISK&quot;  or main:InvoiceCurrencyCode = &quot;JEP&quot;  or main:InvoiceCurrencyCode = &quot;JMD&quot;  or main:InvoiceCurrencyCode = &quot;JOD&quot;  or main:InvoiceCurrencyCode = &quot;JPY&quot;  or main:InvoiceCurrencyCode = &quot;KES&quot;  or main:InvoiceCurrencyCode = &quot;KGS&quot;  or main:InvoiceCurrencyCode = &quot;KHR&quot;  or main:InvoiceCurrencyCode = &quot;KMF&quot;  or main:InvoiceCurrencyCode = &quot;KPW&quot;  or main:InvoiceCurrencyCode = &quot;KRW&quot;  or main:InvoiceCurrencyCode = &quot;KWD&quot;  or main:InvoiceCurrencyCode = &quot;KYD&quot;  or main:InvoiceCurrencyCode = &quot;KZT&quot;  or main:InvoiceCurrencyCode = &quot;LAK&quot;  or main:InvoiceCurrencyCode = &quot;LBP&quot;  or main:InvoiceCurrencyCode = &quot;LKR&quot;  or main:InvoiceCurrencyCode = &quot;LRD&quot;  or main:InvoiceCurrencyCode = &quot;LSL&quot;  or main:InvoiceCurrencyCode = &quot;LTL&quot;  or main:InvoiceCurrencyCode = &quot;LVL&quot;  or main:InvoiceCurrencyCode = &quot;LYD&quot;  or main:InvoiceCurrencyCode = &quot;MAD&quot;  or main:InvoiceCurrencyCode = &quot;MDL&quot;  or main:InvoiceCurrencyCode = &quot;MGA&quot;  or main:InvoiceCurrencyCode = &quot;MKD&quot;  or main:InvoiceCurrencyCode = &quot;MMK&quot;  or main:InvoiceCurrencyCode = &quot;MNT&quot;  or main:InvoiceCurrencyCode = &quot;MOP&quot;  or main:InvoiceCurrencyCode = &quot;MRO&quot;  or main:InvoiceCurrencyCode = &quot;MTL&quot;  or main:InvoiceCurrencyCode = &quot;MUR&quot;  or main:InvoiceCurrencyCode = &quot;MVR&quot;  or main:InvoiceCurrencyCode = &quot;MWK&quot;  or main:InvoiceCurrencyCode = &quot;MXN&quot;  or main:InvoiceCurrencyCode = &quot;MYR&quot;  or main:InvoiceCurrencyCode = &quot;MZM&quot;  or main:InvoiceCurrencyCode = &quot;NAD&quot;  or main:InvoiceCurrencyCode = &quot;NGN&quot;  or main:InvoiceCurrencyCode = &quot;NIO&quot;  or main:InvoiceCurrencyCode = &quot;NOK&quot;  or main:InvoiceCurrencyCode = &quot;NPR&quot;  or main:InvoiceCurrencyCode = &quot;NZD&quot;  or main:InvoiceCurrencyCode = &quot;OMR&quot;  or main:InvoiceCurrencyCode = &quot;PAB&quot;  or main:InvoiceCurrencyCode = &quot;PEN&quot;  or main:InvoiceCurrencyCode = &quot;PGK&quot;  or main:InvoiceCurrencyCode = &quot;PHP&quot;  or main:InvoiceCurrencyCode = &quot;PKR&quot;  or main:InvoiceCurrencyCode = &quot;PLN&quot;  or main:InvoiceCurrencyCode = &quot;PYG&quot;  or main:InvoiceCurrencyCode = &quot;QAR&quot;  or main:InvoiceCurrencyCode = &quot;ROL&quot;  or main:InvoiceCurrencyCode = &quot;RON&quot;  or main:InvoiceCurrencyCode = &quot;RUB&quot;  or main:InvoiceCurrencyCode = &quot;RWF&quot;  or main:InvoiceCurrencyCode = &quot;SAR&quot;  or main:InvoiceCurrencyCode = &quot;SBD&quot;  or main:InvoiceCurrencyCode = &quot;SCR&quot;  or main:InvoiceCurrencyCode = &quot;SDD&quot;  or main:InvoiceCurrencyCode = &quot;SEK&quot;  or main:InvoiceCurrencyCode = &quot;SGD&quot;  or main:InvoiceCurrencyCode = &quot;SHP&quot;  or main:InvoiceCurrencyCode = &quot;SIT&quot;  or main:InvoiceCurrencyCode = &quot;SKK&quot;  or main:InvoiceCurrencyCode = &quot;SLL&quot;  or main:InvoiceCurrencyCode = &quot;SOS&quot;  or main:InvoiceCurrencyCode = &quot;SPL&quot;  or main:InvoiceCurrencyCode = &quot;SRD&quot;  or main:InvoiceCurrencyCode = &quot;STD&quot;  or main:InvoiceCurrencyCode = &quot;SVC&quot;  or main:InvoiceCurrencyCode = &quot;SYP&quot;  or main:InvoiceCurrencyCode = &quot;SZL&quot;  or main:InvoiceCurrencyCode = &quot;THB&quot;  or main:InvoiceCurrencyCode = &quot;TJS&quot;  or main:InvoiceCurrencyCode = &quot;TMM&quot;  or main:InvoiceCurrencyCode = &quot;TND&quot;  or main:InvoiceCurrencyCode = &quot;TOP&quot;  or main:InvoiceCurrencyCode = &quot;TRY&quot;  or main:InvoiceCurrencyCode = &quot;TTD&quot;  or main:InvoiceCurrencyCode = &quot;TVD&quot;  or main:InvoiceCurrencyCode = &quot;TWD&quot;  or main:InvoiceCurrencyCode = &quot;TZS&quot;  or main:InvoiceCurrencyCode = &quot;UAH&quot;  or main:InvoiceCurrencyCode = &quot;UGX&quot;  or main:InvoiceCurrencyCode = &quot;USD&quot;  or main:InvoiceCurrencyCode = &quot;UYU&quot;  or main:InvoiceCurrencyCode = &quot;UZS&quot;  or main:InvoiceCurrencyCode = &quot;VEB&quot;  or main:InvoiceCurrencyCode = &quot;VND&quot;  or main:InvoiceCurrencyCode = &quot;VUV&quot;  or main:InvoiceCurrencyCode = &quot;WST&quot;  or main:InvoiceCurrencyCode = &quot;XAF&quot;  or main:InvoiceCurrencyCode = &quot;XAG&quot;  or main:InvoiceCurrencyCode = &quot;XAU&quot;  or main:InvoiceCurrencyCode = &quot;XCD&quot;  or main:InvoiceCurrencyCode = &quot;XDR&quot;  or main:InvoiceCurrencyCode = &quot;XOF&quot;  or main:InvoiceCurrencyCode = &quot;XPD&quot;  or main:InvoiceCurrencyCode = &quot;XPF&quot;  or main:InvoiceCurrencyCode = &quot;XPT&quot;  or main:InvoiceCurrencyCode = &quot;YER&quot;  or main:InvoiceCurrencyCode = &quot;ZAR&quot;  or main:InvoiceCurrencyCode = &quot;ZMK&quot;  or main:InvoiceCurrencyCode = &quot;ZWD&quot;  " />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>main:InvoiceCurrencyCode = "AED" or main:InvoiceCurrencyCode = "AFN" or main:InvoiceCurrencyCode = "ALL" or main:InvoiceCurrencyCode = "AMD" or main:InvoiceCurrencyCode = "ANG" or main:InvoiceCurrencyCode = "AOA" or main:InvoiceCurrencyCode = "ARS" or main:InvoiceCurrencyCode = "AUD" or main:InvoiceCurrencyCode = "AWG" or main:InvoiceCurrencyCode = "AZM" or main:InvoiceCurrencyCode = "AZN" or main:InvoiceCurrencyCode = "BAM" or main:InvoiceCurrencyCode = "BBD" or main:InvoiceCurrencyCode = "BDT" or main:InvoiceCurrencyCode = "BGN" or main:InvoiceCurrencyCode = "BHD" or main:InvoiceCurrencyCode = "BIF" or main:InvoiceCurrencyCode = "BMD" or main:InvoiceCurrencyCode = "BND" or main:InvoiceCurrencyCode = "BOB" or main:InvoiceCurrencyCode = "BRL" or main:InvoiceCurrencyCode = "BSD" or main:InvoiceCurrencyCode = "BTN" or main:InvoiceCurrencyCode = "BWP" or main:InvoiceCurrencyCode = "BYR" or main:InvoiceCurrencyCode = "BZD" or main:InvoiceCurrencyCode = "CAD" or main:InvoiceCurrencyCode = "CDF" or main:InvoiceCurrencyCode = "CHF" or main:InvoiceCurrencyCode = "CLP" or main:InvoiceCurrencyCode = "CNY" or main:InvoiceCurrencyCode = "COP" or main:InvoiceCurrencyCode = "CRC" or main:InvoiceCurrencyCode = "CSD" or main:InvoiceCurrencyCode = "CUP" or main:InvoiceCurrencyCode = "CVE" or main:InvoiceCurrencyCode = "CYP" or main:InvoiceCurrencyCode = "CZK" or main:InvoiceCurrencyCode = "DJF" or main:InvoiceCurrencyCode = "DKK" or main:InvoiceCurrencyCode = "DOP" or main:InvoiceCurrencyCode = "DZD" or main:InvoiceCurrencyCode = "EEK" or main:InvoiceCurrencyCode = "EGP" or main:InvoiceCurrencyCode = "ERN" or main:InvoiceCurrencyCode = "ETB" or main:InvoiceCurrencyCode = "EUR" or main:InvoiceCurrencyCode = "FJD" or main:InvoiceCurrencyCode = "FKP" or main:InvoiceCurrencyCode = "GBP" or main:InvoiceCurrencyCode = "GEL" or main:InvoiceCurrencyCode = "GGP" or main:InvoiceCurrencyCode = "GHC" or main:InvoiceCurrencyCode = "GIP" or main:InvoiceCurrencyCode = "GMD" or main:InvoiceCurrencyCode = "GNF" or main:InvoiceCurrencyCode = "GTQ" or main:InvoiceCurrencyCode = "GYD" or main:InvoiceCurrencyCode = "HKD" or main:InvoiceCurrencyCode = "HNL" or main:InvoiceCurrencyCode = "HRK" or main:InvoiceCurrencyCode = "HTG" or main:InvoiceCurrencyCode = "HUF" or main:InvoiceCurrencyCode = "IDR" or main:InvoiceCurrencyCode = "ILS" or main:InvoiceCurrencyCode = "IMP" or main:InvoiceCurrencyCode = "INR" or main:InvoiceCurrencyCode = "IQD" or main:InvoiceCurrencyCode = "IRR" or main:InvoiceCurrencyCode = "ISK" or main:InvoiceCurrencyCode = "JEP" or main:InvoiceCurrencyCode = "JMD" or main:InvoiceCurrencyCode = "JOD" or main:InvoiceCurrencyCode = "JPY" or main:InvoiceCurrencyCode = "KES" or main:InvoiceCurrencyCode = "KGS" or main:InvoiceCurrencyCode = "KHR" or main:InvoiceCurrencyCode = "KMF" or main:InvoiceCurrencyCode = "KPW" or main:InvoiceCurrencyCode = "KRW" or main:InvoiceCurrencyCode = "KWD" or main:InvoiceCurrencyCode = "KYD" or main:InvoiceCurrencyCode = "KZT" or main:InvoiceCurrencyCode = "LAK" or main:InvoiceCurrencyCode = "LBP" or main:InvoiceCurrencyCode = "LKR" or main:InvoiceCurrencyCode = "LRD" or main:InvoiceCurrencyCode = "LSL" or main:InvoiceCurrencyCode = "LTL" or main:InvoiceCurrencyCode = "LVL" or main:InvoiceCurrencyCode = "LYD" or main:InvoiceCurrencyCode = "MAD" or main:InvoiceCurrencyCode = "MDL" or main:InvoiceCurrencyCode = "MGA" or main:InvoiceCurrencyCode = "MKD" or main:InvoiceCurrencyCode = "MMK" or main:InvoiceCurrencyCode = "MNT" or main:InvoiceCurrencyCode = "MOP" or main:InvoiceCurrencyCode = "MRO" or main:InvoiceCurrencyCode = "MTL" or main:InvoiceCurrencyCode = "MUR" or main:InvoiceCurrencyCode = "MVR" or main:InvoiceCurrencyCode = "MWK" or main:InvoiceCurrencyCode = "MXN" or main:InvoiceCurrencyCode = "MYR" or main:InvoiceCurrencyCode = "MZM" or main:InvoiceCurrencyCode = "NAD" or main:InvoiceCurrencyCode = "NGN" or main:InvoiceCurrencyCode = "NIO" or main:InvoiceCurrencyCode = "NOK" or main:InvoiceCurrencyCode = "NPR" or main:InvoiceCurrencyCode = "NZD" or main:InvoiceCurrencyCode = "OMR" or main:InvoiceCurrencyCode = "PAB" or main:InvoiceCurrencyCode = "PEN" or main:InvoiceCurrencyCode = "PGK" or main:InvoiceCurrencyCode = "PHP" or main:InvoiceCurrencyCode = "PKR" or main:InvoiceCurrencyCode = "PLN" or main:InvoiceCurrencyCode = "PYG" or main:InvoiceCurrencyCode = "QAR" or main:InvoiceCurrencyCode = "ROL" or main:InvoiceCurrencyCode = "RON" or main:InvoiceCurrencyCode = "RUB" or main:InvoiceCurrencyCode = "RWF" or main:InvoiceCurrencyCode = "SAR" or main:InvoiceCurrencyCode = "SBD" or main:InvoiceCurrencyCode = "SCR" or main:InvoiceCurrencyCode = "SDD" or main:InvoiceCurrencyCode = "SEK" or main:InvoiceCurrencyCode = "SGD" or main:InvoiceCurrencyCode = "SHP" or main:InvoiceCurrencyCode = "SIT" or main:InvoiceCurrencyCode = "SKK" or main:InvoiceCurrencyCode = "SLL" or main:InvoiceCurrencyCode = "SOS" or main:InvoiceCurrencyCode = "SPL" or main:InvoiceCurrencyCode = "SRD" or main:InvoiceCurrencyCode = "STD" or main:InvoiceCurrencyCode = "SVC" or main:InvoiceCurrencyCode = "SYP" or main:InvoiceCurrencyCode = "SZL" or main:InvoiceCurrencyCode = "THB" or main:InvoiceCurrencyCode = "TJS" or main:InvoiceCurrencyCode = "TMM" or main:InvoiceCurrencyCode = "TND" or main:InvoiceCurrencyCode = "TOP" or main:InvoiceCurrencyCode = "TRY" or main:InvoiceCurrencyCode = "TTD" or main:InvoiceCurrencyCode = "TVD" or main:InvoiceCurrencyCode = "TWD" or main:InvoiceCurrencyCode = "TZS" or main:InvoiceCurrencyCode = "UAH" or main:InvoiceCurrencyCode = "UGX" or main:InvoiceCurrencyCode = "USD" or main:InvoiceCurrencyCode = "UYU" or main:InvoiceCurrencyCode = "UZS" or main:InvoiceCurrencyCode = "VEB" or main:InvoiceCurrencyCode = "VND" or main:InvoiceCurrencyCode = "VUV" or main:InvoiceCurrencyCode = "WST" or main:InvoiceCurrencyCode = "XAF" or main:InvoiceCurrencyCode = "XAG" or main:InvoiceCurrencyCode = "XAU" or main:InvoiceCurrencyCode = "XCD" or main:InvoiceCurrencyCode = "XDR" or main:InvoiceCurrencyCode = "XOF" or main:InvoiceCurrencyCode = "XPD" or main:InvoiceCurrencyCode = "XPF" or main:InvoiceCurrencyCode = "XPT" or main:InvoiceCurrencyCode = "YER" or main:InvoiceCurrencyCode = "ZAR" or main:InvoiceCurrencyCode = "ZMK" or main:InvoiceCurrencyCode = "ZWD"</pattern>:
   main:InvoiceCurrencyCode should be uppercase
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="com:InvoiceLine" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:InvoiceLine</pattern>:
   There must be an InvoiceLine
</error></xsl:otherwise>
</xsl:choose>
<xsl:if test="(contains(namespace-uri(),'pip/') or contains(namespace-uri(),'pcp/')) and not(main:EncodedDocument)">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>(contains(namespace-uri(),'pip/') or contains(namespace-uri(),'pcp/')) and not(main:EncodedDocument)</pattern>:
   In Pip or PCP documents EncodedDocument must be present.
</error></xsl:if>
<xsl:choose>
<xsl:when test="com:BuyerParty" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:BuyerParty</pattern>:
   There must be a BuyerParty must exist
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="com:SellerParty" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:SellerParty</pattern>:
   There must be a SellerParty must exist
</error></xsl:otherwise>
</xsl:choose>
<!-- <xsl:if test="com:BuyerParty[string-length(com:Address/com:HouseNumber) &lt; 1] | com:SellerParty[string-length(com:Address/com:HouseNumber) &lt; 1]">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:BuyerParty[string-length(com:Address/com:HouseNumber) &lt; 1] | com:SellerParty[string-length(com:Address/com:HouseNumber) &lt; 1]</pattern>:
   WARNING: It is a bad practice not to have HouseNumber filled out, although it is not a refuseable error.
</error></xsl:if> -->
<xsl:choose>
<xsl:when test="(count(com:TaxTotal)&lt;3) and (count(com:TaxTotal)&gt;0)" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>(count(com:TaxTotal)&lt;3) and (count(com:TaxTotal)&gt;0)</pattern>:
   TaxTotal should occur between 1-2 times.
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M7" />
</xsl:template>
<xsl:template match="/pip:Invoice | /pcp:Invoice" priority="3999" mode="M7">
<xsl:choose>
<xsl:when test="string-length(com:IssueDate) &gt; 0 " />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(com:IssueDate) &gt; 0</pattern>:
   IssueDate under Invoice must have content
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="string-length(com:ID) &gt; 0 " />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(com:ID) &gt; 0</pattern>:
   ID under Invoice must have content
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="string-length(main:EncodedDocument) &gt; 0 " />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(main:EncodedDocument) &gt; 0</pattern>:
   EncodedDocument under Invoice must have content
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="string-length(com:ReferencedOrder/com:BuyersOrderID) &gt; 0 " />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(com:ReferencedOrder/com:BuyersOrderID) &gt; 0</pattern>:
   com:ReferencedOrder/com:BuyerContact/com:BuyersOrderID under Invoice must have content
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="string-length(com:BuyerParty/com:BuyerContact/com:ID) &gt; 0 " />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(com:BuyerParty/com:BuyerContact/com:ID) &gt; 0</pattern>:
   com:BuyerParty/com:BuyerContact/com:ID under Invoice must have content
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="string-length(com:SellerParty/com:ID) &gt; 0 " />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(com:SellerParty/com:ID) &gt; 0</pattern>:
   SellerParty/ID under Invoice must have content
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="string-length(com:SellerParty/com:PartyTaxScheme/com:CompanyTaxID) &gt; 0 " />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(com:SellerParty/com:PartyTaxScheme/com:CompanyTaxID) &gt; 0</pattern>:
   com:SellerParty/com:PartyTaxScheme/com:CompanyTaxID under Invoice must have content
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="string-length(com:PaymentMeans/com:TypeCodeID) &gt; 0 " />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(com:PaymentMeans/com:TypeCodeID) &gt; 0</pattern>:
   com:PaymentMeans/com:TypeCodeID under Invoice must have content
</error></xsl:otherwise>
</xsl:choose>
<!-- <xsl:choose>
<xsl:when test="string-length(com:PaymentMeans/com:PaymentDueDate) &gt; 0 " />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(com:PaymentMeans/com:PaymentDueDate) &gt; 0</pattern>:
   com:PaymentMeans/com:PaymentDueDate under Invoice must have content
</error></xsl:otherwise>
</xsl:choose> -->
<xsl:apply-templates mode="M7" />
</xsl:template>
<xsl:template match="text()" priority="-1" mode="M7" />
<xsl:template match="com:DestinationParty[parent::pie:Invoice or parent::pcm:Invoice]" priority="4000" mode="M8">
<xsl:if test="count(com:Address)&gt;1">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>count(com:Address)&gt;1</pattern>:
   There should only be one Address under DestinationParty
</error></xsl:if>
<xsl:if test="count(com:Contact)&gt;1">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>count(com:Contact)&gt;1</pattern>:
   There should only be one Contact under DestinationParty
</error></xsl:if>
<xsl:if test="count(com:Language)&gt;1">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>count(com:Language)&gt;1</pattern>:
   There should only be one Language under DestinationParty
</error></xsl:if>
<xsl:if test="count(com:PartyName)&gt;1">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>count(com:PartyName)&gt;1</pattern>:
   There should only be one PartyName under DestinationParty
</error></xsl:if>
<xsl:choose>
<xsl:when test="&#xA;   com:Address/com:Country/com:Code='AF'&#xA;or com:Address/com:Country/com:Code='AX'&#xA;or com:Address/com:Country/com:Code='AL' &#xA;or com:Address/com:Country/com:Code='DZ' &#xA;or com:Address/com:Country/com:Code='AS' &#xA;or com:Address/com:Country/com:Code='AD' &#xA;or com:Address/com:Country/com:Code='AO' &#xA;or com:Address/com:Country/com:Code='AI' &#xA;or com:Address/com:Country/com:Code='AQ' &#xA;or com:Address/com:Country/com:Code='AG' &#xA;or com:Address/com:Country/com:Code='AR' &#xA;or com:Address/com:Country/com:Code='AM' &#xA;or com:Address/com:Country/com:Code='AW' &#xA;or com:Address/com:Country/com:Code='AU' &#xA;or com:Address/com:Country/com:Code='AT' &#xA;or com:Address/com:Country/com:Code='AZ' &#xA;or com:Address/com:Country/com:Code='BS' &#xA;or com:Address/com:Country/com:Code='BH' &#xA;or com:Address/com:Country/com:Code='BD' &#xA;or com:Address/com:Country/com:Code='BB' &#xA;or com:Address/com:Country/com:Code='BY' &#xA;or com:Address/com:Country/com:Code='BE' &#xA;or com:Address/com:Country/com:Code='BZ' &#xA;or com:Address/com:Country/com:Code='BJ' &#xA;or com:Address/com:Country/com:Code='BM' &#xA;or com:Address/com:Country/com:Code='BT' &#xA;or com:Address/com:Country/com:Code='BO' &#xA;or com:Address/com:Country/com:Code='BA' &#xA;or com:Address/com:Country/com:Code='BW' &#xA;or com:Address/com:Country/com:Code='BV' &#xA;or com:Address/com:Country/com:Code='BR' &#xA;or com:Address/com:Country/com:Code='IO' &#xA;or com:Address/com:Country/com:Code='BN' &#xA;or com:Address/com:Country/com:Code='BG' &#xA;or com:Address/com:Country/com:Code='BF' &#xA;or com:Address/com:Country/com:Code='BI' &#xA;or com:Address/com:Country/com:Code='KH' &#xA;or com:Address/com:Country/com:Code='CM' &#xA;or com:Address/com:Country/com:Code='CA' &#xA;or com:Address/com:Country/com:Code='CV' &#xA;or com:Address/com:Country/com:Code='KY' &#xA;or com:Address/com:Country/com:Code='CF' &#xA;or com:Address/com:Country/com:Code='TD' &#xA;or com:Address/com:Country/com:Code='CL' &#xA;or com:Address/com:Country/com:Code='CN' &#xA;or com:Address/com:Country/com:Code='CX' &#xA;or com:Address/com:Country/com:Code='CC' &#xA;or com:Address/com:Country/com:Code='CO' &#xA;or com:Address/com:Country/com:Code='KM' &#xA;or com:Address/com:Country/com:Code='CG' &#xA;or com:Address/com:Country/com:Code='CD' &#xA;or com:Address/com:Country/com:Code='CK' &#xA;or com:Address/com:Country/com:Code='CR' &#xA;or com:Address/com:Country/com:Code='CI' &#xA;or com:Address/com:Country/com:Code='HR' &#xA;or com:Address/com:Country/com:Code='CU' &#xA;or com:Address/com:Country/com:Code='CY' &#xA;or com:Address/com:Country/com:Code='CZ' &#xA;or com:Address/com:Country/com:Code='DK' &#xA;or com:Address/com:Country/com:Code='DJ' &#xA;or com:Address/com:Country/com:Code='DM' &#xA;or com:Address/com:Country/com:Code='DO' &#xA;or com:Address/com:Country/com:Code='EC' &#xA;or com:Address/com:Country/com:Code='EG' &#xA;or com:Address/com:Country/com:Code='SV' &#xA;or com:Address/com:Country/com:Code='GQ' &#xA;or com:Address/com:Country/com:Code='ER' &#xA;or com:Address/com:Country/com:Code='EE' &#xA;or com:Address/com:Country/com:Code='ET' &#xA;or com:Address/com:Country/com:Code='FK' &#xA;or com:Address/com:Country/com:Code='FO' &#xA;or com:Address/com:Country/com:Code='FJ' &#xA;or com:Address/com:Country/com:Code='FI' &#xA;or com:Address/com:Country/com:Code='FR' &#xA;or com:Address/com:Country/com:Code='GF' &#xA;or com:Address/com:Country/com:Code='PF' &#xA;or com:Address/com:Country/com:Code='TF' &#xA;or com:Address/com:Country/com:Code='GA' &#xA;or com:Address/com:Country/com:Code='GM' &#xA;or com:Address/com:Country/com:Code='GE' &#xA;or com:Address/com:Country/com:Code='DE' &#xA;or com:Address/com:Country/com:Code='GH' &#xA;or com:Address/com:Country/com:Code='GI' &#xA;or com:Address/com:Country/com:Code='GR' &#xA;or com:Address/com:Country/com:Code='GL' &#xA;or com:Address/com:Country/com:Code='GD' &#xA;or com:Address/com:Country/com:Code='GP' &#xA;or com:Address/com:Country/com:Code='GU' &#xA;or com:Address/com:Country/com:Code='GT' &#xA;or com:Address/com:Country/com:Code='GG' &#xA;or com:Address/com:Country/com:Code='GN' &#xA;or com:Address/com:Country/com:Code='GW' &#xA;or com:Address/com:Country/com:Code='GY' &#xA;or com:Address/com:Country/com:Code='HT' &#xA;or com:Address/com:Country/com:Code='HM' &#xA;or com:Address/com:Country/com:Code='VA' &#xA;or com:Address/com:Country/com:Code='HN' &#xA;or com:Address/com:Country/com:Code='HK' &#xA;or com:Address/com:Country/com:Code='HU' &#xA;or com:Address/com:Country/com:Code='IS' &#xA;or com:Address/com:Country/com:Code='IN' &#xA;or com:Address/com:Country/com:Code='ID' &#xA;or com:Address/com:Country/com:Code='IR' &#xA;or com:Address/com:Country/com:Code='IQ' &#xA;or com:Address/com:Country/com:Code='IE' &#xA;or com:Address/com:Country/com:Code='IL' &#xA;or com:Address/com:Country/com:Code='IT' &#xA;or com:Address/com:Country/com:Code='JM' &#xA;or com:Address/com:Country/com:Code='JP' &#xA;or com:Address/com:Country/com:Code='JE' &#xA;or com:Address/com:Country/com:Code='JO' &#xA;or com:Address/com:Country/com:Code='KZ' &#xA;or com:Address/com:Country/com:Code='KE' &#xA;or com:Address/com:Country/com:Code='KI' &#xA;or com:Address/com:Country/com:Code='KP' &#xA;or com:Address/com:Country/com:Code='KR' &#xA;or com:Address/com:Country/com:Code='KW' &#xA;or com:Address/com:Country/com:Code='KG' &#xA;or com:Address/com:Country/com:Code='LA' &#xA;or com:Address/com:Country/com:Code='LV' &#xA;or com:Address/com:Country/com:Code='LB' &#xA;or com:Address/com:Country/com:Code='LS' &#xA;or com:Address/com:Country/com:Code='LR' &#xA;or com:Address/com:Country/com:Code='LY' &#xA;or com:Address/com:Country/com:Code='LI' &#xA;or com:Address/com:Country/com:Code='LT' &#xA;or com:Address/com:Country/com:Code='LU' &#xA;or com:Address/com:Country/com:Code='MO' &#xA;or com:Address/com:Country/com:Code='MK' &#xA;or com:Address/com:Country/com:Code='MG' &#xA;or com:Address/com:Country/com:Code='MW' &#xA;or com:Address/com:Country/com:Code='MY' &#xA;or com:Address/com:Country/com:Code='MV' &#xA;or com:Address/com:Country/com:Code='ML' &#xA;or com:Address/com:Country/com:Code='MT' &#xA;or com:Address/com:Country/com:Code='MH' &#xA;or com:Address/com:Country/com:Code='MQ' &#xA;or com:Address/com:Country/com:Code='MR' &#xA;or com:Address/com:Country/com:Code='MU' &#xA;or com:Address/com:Country/com:Code='YT' &#xA;or com:Address/com:Country/com:Code='MX' &#xA;or com:Address/com:Country/com:Code='FM' &#xA;or com:Address/com:Country/com:Code='MD' &#xA;or com:Address/com:Country/com:Code='MC' &#xA;or com:Address/com:Country/com:Code='MN' &#xA;or com:Address/com:Country/com:Code='MS' &#xA;or com:Address/com:Country/com:Code='MA' &#xA;or com:Address/com:Country/com:Code='MZ' &#xA;or com:Address/com:Country/com:Code='MM' &#xA;or com:Address/com:Country/com:Code='NA' &#xA;or com:Address/com:Country/com:Code='NR' &#xA;or com:Address/com:Country/com:Code='NP' &#xA;or com:Address/com:Country/com:Code='NL' &#xA;or com:Address/com:Country/com:Code='AN' &#xA;or com:Address/com:Country/com:Code='NC' &#xA;or com:Address/com:Country/com:Code='NZ' &#xA;or com:Address/com:Country/com:Code='NI' &#xA;or com:Address/com:Country/com:Code='NE' &#xA;or com:Address/com:Country/com:Code='NG' &#xA;or com:Address/com:Country/com:Code='NU' &#xA;or com:Address/com:Country/com:Code='NF' &#xA;or com:Address/com:Country/com:Code='MP' &#xA;or com:Address/com:Country/com:Code='NO' &#xA;or com:Address/com:Country/com:Code='OM' &#xA;or com:Address/com:Country/com:Code='PK' &#xA;or com:Address/com:Country/com:Code='PW' &#xA;or com:Address/com:Country/com:Code='PS' &#xA;or com:Address/com:Country/com:Code='PA' &#xA;or com:Address/com:Country/com:Code='PG' &#xA;or com:Address/com:Country/com:Code='PY' &#xA;or com:Address/com:Country/com:Code='PE' &#xA;or com:Address/com:Country/com:Code='PH' &#xA;or com:Address/com:Country/com:Code='PN' &#xA;or com:Address/com:Country/com:Code='PL' &#xA;or com:Address/com:Country/com:Code='PT' &#xA;or com:Address/com:Country/com:Code='PR' &#xA;or com:Address/com:Country/com:Code='QA' &#xA;or com:Address/com:Country/com:Code='RE' &#xA;or com:Address/com:Country/com:Code='RO' &#xA;or com:Address/com:Country/com:Code='RU' &#xA;or com:Address/com:Country/com:Code='RW' &#xA;or com:Address/com:Country/com:Code='SH' &#xA;or com:Address/com:Country/com:Code='KN' &#xA;or com:Address/com:Country/com:Code='LC' &#xA;or com:Address/com:Country/com:Code='PM' &#xA;or com:Address/com:Country/com:Code='VC' &#xA;or com:Address/com:Country/com:Code='WS' &#xA;or com:Address/com:Country/com:Code='SM' &#xA;or com:Address/com:Country/com:Code='ST' &#xA;or com:Address/com:Country/com:Code='SA' &#xA;or com:Address/com:Country/com:Code='SN' &#xA;or com:Address/com:Country/com:Code='CS' &#xA;or com:Address/com:Country/com:Code='SC'&#xA;or com:Address/com:Country/com:Code='SG' &#xA;or com:Address/com:Country/com:Code='SK' &#xA;or com:Address/com:Country/com:Code='SI' &#xA;or com:Address/com:Country/com:Code='SB' &#xA;or com:Address/com:Country/com:Code='SO' &#xA;or com:Address/com:Country/com:Code='ZA' &#xA;or com:Address/com:Country/com:Code='GS' &#xA;or com:Address/com:Country/com:Code='ES' &#xA;or com:Address/com:Country/com:Code='LK' &#xA;or com:Address/com:Country/com:Code='SD' &#xA;or com:Address/com:Country/com:Code='SR' &#xA;or com:Address/com:Country/com:Code='SJ' &#xA;or com:Address/com:Country/com:Code='SZ' &#xA;or com:Address/com:Country/com:Code='SE' &#xA;or com:Address/com:Country/com:Code='CH' &#xA;or com:Address/com:Country/com:Code='SY' &#xA;or com:Address/com:Country/com:Code='TW' &#xA;or com:Address/com:Country/com:Code='TJ' &#xA;or com:Address/com:Country/com:Code='TZ' &#xA;or com:Address/com:Country/com:Code='TH' &#xA;or com:Address/com:Country/com:Code='TL' &#xA;or com:Address/com:Country/com:Code='TG' &#xA;or com:Address/com:Country/com:Code='TK' &#xA;or com:Address/com:Country/com:Code='TO' &#xA;or com:Address/com:Country/com:Code='TT' &#xA;or com:Address/com:Country/com:Code='TN' &#xA;or com:Address/com:Country/com:Code='TR' &#xA;or com:Address/com:Country/com:Code='TM' &#xA;or com:Address/com:Country/com:Code='TC' &#xA;or com:Address/com:Country/com:Code='TV' &#xA;or com:Address/com:Country/com:Code='UG' &#xA;or com:Address/com:Country/com:Code='UA' &#xA;or com:Address/com:Country/com:Code='AE' &#xA;or com:Address/com:Country/com:Code='GB' &#xA;or com:Address/com:Country/com:Code='US' &#xA;or com:Address/com:Country/com:Code='UM' &#xA;or com:Address/com:Country/com:Code='UY' &#xA;or com:Address/com:Country/com:Code='UZ' &#xA;or com:Address/com:Country/com:Code='VU' &#xA;or com:Address/com:Country/com:Code='VE' &#xA;or com:Address/com:Country/com:Code='VN' &#xA;or com:Address/com:Country/com:Code='VG' &#xA;or com:Address/com:Country/com:Code='VI' &#xA;or com:Address/com:Country/com:Code='WF' &#xA;or com:Address/com:Country/com:Code='EH' &#xA;or com:Address/com:Country/com:Code='YE' &#xA;or com:Address/com:Country/com:Code='ZM' &#xA;or com:Address/com:Country/com:Code='ZW'" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:Address/com:Country/com:Code='AF' or com:Address/com:Country/com:Code='AX' or com:Address/com:Country/com:Code='AL' or com:Address/com:Country/com:Code='DZ' or com:Address/com:Country/com:Code='AS' or com:Address/com:Country/com:Code='AD' or com:Address/com:Country/com:Code='AO' or com:Address/com:Country/com:Code='AI' or com:Address/com:Country/com:Code='AQ' or com:Address/com:Country/com:Code='AG' or com:Address/com:Country/com:Code='AR' or com:Address/com:Country/com:Code='AM' or com:Address/com:Country/com:Code='AW' or com:Address/com:Country/com:Code='AU' or com:Address/com:Country/com:Code='AT' or com:Address/com:Country/com:Code='AZ' or com:Address/com:Country/com:Code='BS' or com:Address/com:Country/com:Code='BH' or com:Address/com:Country/com:Code='BD' or com:Address/com:Country/com:Code='BB' or com:Address/com:Country/com:Code='BY' or com:Address/com:Country/com:Code='BE' or com:Address/com:Country/com:Code='BZ' or com:Address/com:Country/com:Code='BJ' or com:Address/com:Country/com:Code='BM' or com:Address/com:Country/com:Code='BT' or com:Address/com:Country/com:Code='BO' or com:Address/com:Country/com:Code='BA' or com:Address/com:Country/com:Code='BW' or com:Address/com:Country/com:Code='BV' or com:Address/com:Country/com:Code='BR' or com:Address/com:Country/com:Code='IO' or com:Address/com:Country/com:Code='BN' or com:Address/com:Country/com:Code='BG' or com:Address/com:Country/com:Code='BF' or com:Address/com:Country/com:Code='BI' or com:Address/com:Country/com:Code='KH' or com:Address/com:Country/com:Code='CM' or com:Address/com:Country/com:Code='CA' or com:Address/com:Country/com:Code='CV' or com:Address/com:Country/com:Code='KY' or com:Address/com:Country/com:Code='CF' or com:Address/com:Country/com:Code='TD' or com:Address/com:Country/com:Code='CL' or com:Address/com:Country/com:Code='CN' or com:Address/com:Country/com:Code='CX' or com:Address/com:Country/com:Code='CC' or com:Address/com:Country/com:Code='CO' or com:Address/com:Country/com:Code='KM' or com:Address/com:Country/com:Code='CG' or com:Address/com:Country/com:Code='CD' or com:Address/com:Country/com:Code='CK' or com:Address/com:Country/com:Code='CR' or com:Address/com:Country/com:Code='CI' or com:Address/com:Country/com:Code='HR' or com:Address/com:Country/com:Code='CU' or com:Address/com:Country/com:Code='CY' or com:Address/com:Country/com:Code='CZ' or com:Address/com:Country/com:Code='DK' or com:Address/com:Country/com:Code='DJ' or com:Address/com:Country/com:Code='DM' or com:Address/com:Country/com:Code='DO' or com:Address/com:Country/com:Code='EC' or com:Address/com:Country/com:Code='EG' or com:Address/com:Country/com:Code='SV' or com:Address/com:Country/com:Code='GQ' or com:Address/com:Country/com:Code='ER' or com:Address/com:Country/com:Code='EE' or com:Address/com:Country/com:Code='ET' or com:Address/com:Country/com:Code='FK' or com:Address/com:Country/com:Code='FO' or com:Address/com:Country/com:Code='FJ' or com:Address/com:Country/com:Code='FI' or com:Address/com:Country/com:Code='FR' or com:Address/com:Country/com:Code='GF' or com:Address/com:Country/com:Code='PF' or com:Address/com:Country/com:Code='TF' or com:Address/com:Country/com:Code='GA' or com:Address/com:Country/com:Code='GM' or com:Address/com:Country/com:Code='GE' or com:Address/com:Country/com:Code='DE' or com:Address/com:Country/com:Code='GH' or com:Address/com:Country/com:Code='GI' or com:Address/com:Country/com:Code='GR' or com:Address/com:Country/com:Code='GL' or com:Address/com:Country/com:Code='GD' or com:Address/com:Country/com:Code='GP' or com:Address/com:Country/com:Code='GU' or com:Address/com:Country/com:Code='GT' or com:Address/com:Country/com:Code='GG' or com:Address/com:Country/com:Code='GN' or com:Address/com:Country/com:Code='GW' or com:Address/com:Country/com:Code='GY' or com:Address/com:Country/com:Code='HT' or com:Address/com:Country/com:Code='HM' or com:Address/com:Country/com:Code='VA' or com:Address/com:Country/com:Code='HN' or com:Address/com:Country/com:Code='HK' or com:Address/com:Country/com:Code='HU' or com:Address/com:Country/com:Code='IS' or com:Address/com:Country/com:Code='IN' or com:Address/com:Country/com:Code='ID' or com:Address/com:Country/com:Code='IR' or com:Address/com:Country/com:Code='IQ' or com:Address/com:Country/com:Code='IE' or com:Address/com:Country/com:Code='IL' or com:Address/com:Country/com:Code='IT' or com:Address/com:Country/com:Code='JM' or com:Address/com:Country/com:Code='JP' or com:Address/com:Country/com:Code='JE' or com:Address/com:Country/com:Code='JO' or com:Address/com:Country/com:Code='KZ' or com:Address/com:Country/com:Code='KE' or com:Address/com:Country/com:Code='KI' or com:Address/com:Country/com:Code='KP' or com:Address/com:Country/com:Code='KR' or com:Address/com:Country/com:Code='KW' or com:Address/com:Country/com:Code='KG' or com:Address/com:Country/com:Code='LA' or com:Address/com:Country/com:Code='LV' or com:Address/com:Country/com:Code='LB' or com:Address/com:Country/com:Code='LS' or com:Address/com:Country/com:Code='LR' or com:Address/com:Country/com:Code='LY' or com:Address/com:Country/com:Code='LI' or com:Address/com:Country/com:Code='LT' or com:Address/com:Country/com:Code='LU' or com:Address/com:Country/com:Code='MO' or com:Address/com:Country/com:Code='MK' or com:Address/com:Country/com:Code='MG' or com:Address/com:Country/com:Code='MW' or com:Address/com:Country/com:Code='MY' or com:Address/com:Country/com:Code='MV' or com:Address/com:Country/com:Code='ML' or com:Address/com:Country/com:Code='MT' or com:Address/com:Country/com:Code='MH' or com:Address/com:Country/com:Code='MQ' or com:Address/com:Country/com:Code='MR' or com:Address/com:Country/com:Code='MU' or com:Address/com:Country/com:Code='YT' or com:Address/com:Country/com:Code='MX' or com:Address/com:Country/com:Code='FM' or com:Address/com:Country/com:Code='MD' or com:Address/com:Country/com:Code='MC' or com:Address/com:Country/com:Code='MN' or com:Address/com:Country/com:Code='MS' or com:Address/com:Country/com:Code='MA' or com:Address/com:Country/com:Code='MZ' or com:Address/com:Country/com:Code='MM' or com:Address/com:Country/com:Code='NA' or com:Address/com:Country/com:Code='NR' or com:Address/com:Country/com:Code='NP' or com:Address/com:Country/com:Code='NL' or com:Address/com:Country/com:Code='AN' or com:Address/com:Country/com:Code='NC' or com:Address/com:Country/com:Code='NZ' or com:Address/com:Country/com:Code='NI' or com:Address/com:Country/com:Code='NE' or com:Address/com:Country/com:Code='NG' or com:Address/com:Country/com:Code='NU' or com:Address/com:Country/com:Code='NF' or com:Address/com:Country/com:Code='MP' or com:Address/com:Country/com:Code='NO' or com:Address/com:Country/com:Code='OM' or com:Address/com:Country/com:Code='PK' or com:Address/com:Country/com:Code='PW' or com:Address/com:Country/com:Code='PS' or com:Address/com:Country/com:Code='PA' or com:Address/com:Country/com:Code='PG' or com:Address/com:Country/com:Code='PY' or com:Address/com:Country/com:Code='PE' or com:Address/com:Country/com:Code='PH' or com:Address/com:Country/com:Code='PN' or com:Address/com:Country/com:Code='PL' or com:Address/com:Country/com:Code='PT' or com:Address/com:Country/com:Code='PR' or com:Address/com:Country/com:Code='QA' or com:Address/com:Country/com:Code='RE' or com:Address/com:Country/com:Code='RO' or com:Address/com:Country/com:Code='RU' or com:Address/com:Country/com:Code='RW' or com:Address/com:Country/com:Code='SH' or com:Address/com:Country/com:Code='KN' or com:Address/com:Country/com:Code='LC' or com:Address/com:Country/com:Code='PM' or com:Address/com:Country/com:Code='VC' or com:Address/com:Country/com:Code='WS' or com:Address/com:Country/com:Code='SM' or com:Address/com:Country/com:Code='ST' or com:Address/com:Country/com:Code='SA' or com:Address/com:Country/com:Code='SN' or com:Address/com:Country/com:Code='CS' or com:Address/com:Country/com:Code='SC' or com:Address/com:Country/com:Code='SG' or com:Address/com:Country/com:Code='SK' or com:Address/com:Country/com:Code='SI' or com:Address/com:Country/com:Code='SB' or com:Address/com:Country/com:Code='SO' or com:Address/com:Country/com:Code='ZA' or com:Address/com:Country/com:Code='GS' or com:Address/com:Country/com:Code='ES' or com:Address/com:Country/com:Code='LK' or com:Address/com:Country/com:Code='SD' or com:Address/com:Country/com:Code='SR' or com:Address/com:Country/com:Code='SJ' or com:Address/com:Country/com:Code='SZ' or com:Address/com:Country/com:Code='SE' or com:Address/com:Country/com:Code='CH' or com:Address/com:Country/com:Code='SY' or com:Address/com:Country/com:Code='TW' or com:Address/com:Country/com:Code='TJ' or com:Address/com:Country/com:Code='TZ' or com:Address/com:Country/com:Code='TH' or com:Address/com:Country/com:Code='TL' or com:Address/com:Country/com:Code='TG' or com:Address/com:Country/com:Code='TK' or com:Address/com:Country/com:Code='TO' or com:Address/com:Country/com:Code='TT' or com:Address/com:Country/com:Code='TN' or com:Address/com:Country/com:Code='TR' or com:Address/com:Country/com:Code='TM' or com:Address/com:Country/com:Code='TC' or com:Address/com:Country/com:Code='TV' or com:Address/com:Country/com:Code='UG' or com:Address/com:Country/com:Code='UA' or com:Address/com:Country/com:Code='AE' or com:Address/com:Country/com:Code='GB' or com:Address/com:Country/com:Code='US' or com:Address/com:Country/com:Code='UM' or com:Address/com:Country/com:Code='UY' or com:Address/com:Country/com:Code='UZ' or com:Address/com:Country/com:Code='VU' or com:Address/com:Country/com:Code='VE' or com:Address/com:Country/com:Code='VN' or com:Address/com:Country/com:Code='VG' or com:Address/com:Country/com:Code='VI' or com:Address/com:Country/com:Code='WF' or com:Address/com:Country/com:Code='EH' or com:Address/com:Country/com:Code='YE' or com:Address/com:Country/com:Code='ZM' or com:Address/com:Country/com:Code='ZW'</pattern>:
   DestinationParty com:Address/com:Country/com:Code should be 2 alpha-numerical characters e.g. ”DK” for Denmark
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M8" />
</xsl:template>
<xsl:template match="text()" priority="-1" mode="M8" />
<xsl:template match="com:BuyerContact[/pie:Invoice or /pcm:Invoice][com:Role]" priority="4000" mode="M9">
<xsl:choose>
<xsl:when test="com:Role[.='Indkøbsansvarlig' or .='Bogholder' or .='Budgetansvarlig' or .='Rekvirent']" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:Role[.='Indkøbsansvarlig' or .='Bogholder' or .='Budgetansvarlig' or .='Rekvirent']</pattern>:
   BuyerContact Role. Must be either 'Indkøbsansvarlig', 'Bogholder','Budgetansvarlig', or 'Rekvirent'
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M9" />
</xsl:template>
<xsl:template match="text()" priority="-1" mode="M9" />
<xsl:template match="com:ReferencedOrder" priority="4000" mode="M10">
<xsl:choose>
<xsl:when test="string-length(com:BuyersOrderID)&gt;0" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(com:BuyersOrderID)&gt;0</pattern>:
   BuyersOrderID under ReferencedOrder should hold content.
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M10" />
</xsl:template>
<xsl:template match="text()" priority="-1" mode="M10" />
<xsl:template match="com:BuyerParty[com:Address/com:ID='Juridisk'][parent::pie:Invoice or parent::pcm:Invoice]" priority="4000" mode="M11">
<xsl:if test="preceding-sibling::com:BuyerParty[com:Address/com:ID != 'Fakturering'] | following-sibling::com:BuyerParty[com:Address/com:ID != 'Fakturering']">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>preceding-sibling::com:BuyerParty[com:Address/com:ID != 'Fakturering'] | following-sibling::com:BuyerParty[com:Address/com:ID != 'Fakturering']</pattern>:
   BuyerParty com:Address com:ID should have a value of Juridisk or Fakturering, and there should only be one BuyerParty of each type
</error></xsl:if>
<xsl:if test="count(com:Address) &gt;1">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>count(com:Address) &gt;1</pattern>:
   There should only be one Address under BuyerParty, this validation rule is implementable in XML Schema but is not provided as yet.
</error></xsl:if>
<xsl:choose>
<xsl:when test="string-length(com:ID)&gt;0" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(com:ID)&gt;0</pattern>:
   WARNING: there should be some value in ID under BuyerParty
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="count(com:PartyName) &lt; 2" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>count(com:PartyName) &lt; 2</pattern>:
   A BuyerParty should have a single PartyName
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="com:Address/com:CityName" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:Address/com:CityName</pattern>:
   There must be an Address.CityName in BuyerParty
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="com:Address/com:Street" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:Address/com:Street</pattern>:
   There must be an Address.Street in BuyerParty
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="com:Address/com:PostalZone" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:Address/com:PostalZone</pattern>:
   There must be an Address.Street in BuyerParty
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="com:Address/com:Country/com:Code" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:Address/com:Country/com:Code</pattern>:
   There must be an Address.Country.Code in BuyerParty
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="string-length(com:ID)&gt;0" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(com:ID)&gt;0</pattern>:
   WARNING: ID in BuyerParty should have content
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="string-length(com:BuyerContact/com:ID) &gt; 0" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(com:BuyerContact/com:ID) &gt; 0</pattern>:
   ID under BuyerContact must have a value, if you don't have an ID put in the value n/a.
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="&#xA;   com:Address/com:Country/com:Code='AF'&#xA;or com:Address/com:Country/com:Code='AX'&#xA;or com:Address/com:Country/com:Code='AL' &#xA;or com:Address/com:Country/com:Code='DZ' &#xA;or com:Address/com:Country/com:Code='AS' &#xA;or com:Address/com:Country/com:Code='AD' &#xA;or com:Address/com:Country/com:Code='AO' &#xA;or com:Address/com:Country/com:Code='AI' &#xA;or com:Address/com:Country/com:Code='AQ' &#xA;or com:Address/com:Country/com:Code='AG' &#xA;or com:Address/com:Country/com:Code='AR' &#xA;or com:Address/com:Country/com:Code='AM' &#xA;or com:Address/com:Country/com:Code='AW' &#xA;or com:Address/com:Country/com:Code='AU' &#xA;or com:Address/com:Country/com:Code='AT' &#xA;or com:Address/com:Country/com:Code='AZ' &#xA;or com:Address/com:Country/com:Code='BS' &#xA;or com:Address/com:Country/com:Code='BH' &#xA;or com:Address/com:Country/com:Code='BD' &#xA;or com:Address/com:Country/com:Code='BB' &#xA;or com:Address/com:Country/com:Code='BY' &#xA;or com:Address/com:Country/com:Code='BE' &#xA;or com:Address/com:Country/com:Code='BZ' &#xA;or com:Address/com:Country/com:Code='BJ' &#xA;or com:Address/com:Country/com:Code='BM' &#xA;or com:Address/com:Country/com:Code='BT' &#xA;or com:Address/com:Country/com:Code='BO' &#xA;or com:Address/com:Country/com:Code='BA' &#xA;or com:Address/com:Country/com:Code='BW' &#xA;or com:Address/com:Country/com:Code='BV' &#xA;or com:Address/com:Country/com:Code='BR' &#xA;or com:Address/com:Country/com:Code='IO' &#xA;or com:Address/com:Country/com:Code='BN' &#xA;or com:Address/com:Country/com:Code='BG' &#xA;or com:Address/com:Country/com:Code='BF' &#xA;or com:Address/com:Country/com:Code='BI' &#xA;or com:Address/com:Country/com:Code='KH' &#xA;or com:Address/com:Country/com:Code='CM' &#xA;or com:Address/com:Country/com:Code='CA' &#xA;or com:Address/com:Country/com:Code='CV' &#xA;or com:Address/com:Country/com:Code='KY' &#xA;or com:Address/com:Country/com:Code='CF' &#xA;or com:Address/com:Country/com:Code='TD' &#xA;or com:Address/com:Country/com:Code='CL' &#xA;or com:Address/com:Country/com:Code='CN' &#xA;or com:Address/com:Country/com:Code='CX' &#xA;or com:Address/com:Country/com:Code='CC' &#xA;or com:Address/com:Country/com:Code='CO' &#xA;or com:Address/com:Country/com:Code='KM' &#xA;or com:Address/com:Country/com:Code='CG' &#xA;or com:Address/com:Country/com:Code='CD' &#xA;or com:Address/com:Country/com:Code='CK' &#xA;or com:Address/com:Country/com:Code='CR' &#xA;or com:Address/com:Country/com:Code='CI' &#xA;or com:Address/com:Country/com:Code='HR' &#xA;or com:Address/com:Country/com:Code='CU' &#xA;or com:Address/com:Country/com:Code='CY' &#xA;or com:Address/com:Country/com:Code='CZ' &#xA;or com:Address/com:Country/com:Code='DK' &#xA;or com:Address/com:Country/com:Code='DJ' &#xA;or com:Address/com:Country/com:Code='DM' &#xA;or com:Address/com:Country/com:Code='DO' &#xA;or com:Address/com:Country/com:Code='EC' &#xA;or com:Address/com:Country/com:Code='EG' &#xA;or com:Address/com:Country/com:Code='SV' &#xA;or com:Address/com:Country/com:Code='GQ' &#xA;or com:Address/com:Country/com:Code='ER' &#xA;or com:Address/com:Country/com:Code='EE' &#xA;or com:Address/com:Country/com:Code='ET' &#xA;or com:Address/com:Country/com:Code='FK' &#xA;or com:Address/com:Country/com:Code='FO' &#xA;or com:Address/com:Country/com:Code='FJ' &#xA;or com:Address/com:Country/com:Code='FI' &#xA;or com:Address/com:Country/com:Code='FR' &#xA;or com:Address/com:Country/com:Code='GF' &#xA;or com:Address/com:Country/com:Code='PF' &#xA;or com:Address/com:Country/com:Code='TF' &#xA;or com:Address/com:Country/com:Code='GA' &#xA;or com:Address/com:Country/com:Code='GM' &#xA;or com:Address/com:Country/com:Code='GE' &#xA;or com:Address/com:Country/com:Code='DE' &#xA;or com:Address/com:Country/com:Code='GH' &#xA;or com:Address/com:Country/com:Code='GI' &#xA;or com:Address/com:Country/com:Code='GR' &#xA;or com:Address/com:Country/com:Code='GL' &#xA;or com:Address/com:Country/com:Code='GD' &#xA;or com:Address/com:Country/com:Code='GP' &#xA;or com:Address/com:Country/com:Code='GU' &#xA;or com:Address/com:Country/com:Code='GT' &#xA;or com:Address/com:Country/com:Code='GG' &#xA;or com:Address/com:Country/com:Code='GN' &#xA;or com:Address/com:Country/com:Code='GW' &#xA;or com:Address/com:Country/com:Code='GY' &#xA;or com:Address/com:Country/com:Code='HT' &#xA;or com:Address/com:Country/com:Code='HM' &#xA;or com:Address/com:Country/com:Code='VA' &#xA;or com:Address/com:Country/com:Code='HN' &#xA;or com:Address/com:Country/com:Code='HK' &#xA;or com:Address/com:Country/com:Code='HU' &#xA;or com:Address/com:Country/com:Code='IS' &#xA;or com:Address/com:Country/com:Code='IN' &#xA;or com:Address/com:Country/com:Code='ID' &#xA;or com:Address/com:Country/com:Code='IR' &#xA;or com:Address/com:Country/com:Code='IQ' &#xA;or com:Address/com:Country/com:Code='IE' &#xA;or com:Address/com:Country/com:Code='IL' &#xA;or com:Address/com:Country/com:Code='IT' &#xA;or com:Address/com:Country/com:Code='JM' &#xA;or com:Address/com:Country/com:Code='JP' &#xA;or com:Address/com:Country/com:Code='JE' &#xA;or com:Address/com:Country/com:Code='JO' &#xA;or com:Address/com:Country/com:Code='KZ' &#xA;or com:Address/com:Country/com:Code='KE' &#xA;or com:Address/com:Country/com:Code='KI' &#xA;or com:Address/com:Country/com:Code='KP' &#xA;or com:Address/com:Country/com:Code='KR' &#xA;or com:Address/com:Country/com:Code='KW' &#xA;or com:Address/com:Country/com:Code='KG' &#xA;or com:Address/com:Country/com:Code='LA' &#xA;or com:Address/com:Country/com:Code='LV' &#xA;or com:Address/com:Country/com:Code='LB' &#xA;or com:Address/com:Country/com:Code='LS' &#xA;or com:Address/com:Country/com:Code='LR' &#xA;or com:Address/com:Country/com:Code='LY' &#xA;or com:Address/com:Country/com:Code='LI' &#xA;or com:Address/com:Country/com:Code='LT' &#xA;or com:Address/com:Country/com:Code='LU' &#xA;or com:Address/com:Country/com:Code='MO' &#xA;or com:Address/com:Country/com:Code='MK' &#xA;or com:Address/com:Country/com:Code='MG' &#xA;or com:Address/com:Country/com:Code='MW' &#xA;or com:Address/com:Country/com:Code='MY' &#xA;or com:Address/com:Country/com:Code='MV' &#xA;or com:Address/com:Country/com:Code='ML' &#xA;or com:Address/com:Country/com:Code='MT' &#xA;or com:Address/com:Country/com:Code='MH' &#xA;or com:Address/com:Country/com:Code='MQ' &#xA;or com:Address/com:Country/com:Code='MR' &#xA;or com:Address/com:Country/com:Code='MU' &#xA;or com:Address/com:Country/com:Code='YT' &#xA;or com:Address/com:Country/com:Code='MX' &#xA;or com:Address/com:Country/com:Code='FM' &#xA;or com:Address/com:Country/com:Code='MD' &#xA;or com:Address/com:Country/com:Code='MC' &#xA;or com:Address/com:Country/com:Code='MN' &#xA;or com:Address/com:Country/com:Code='MS' &#xA;or com:Address/com:Country/com:Code='MA' &#xA;or com:Address/com:Country/com:Code='MZ' &#xA;or com:Address/com:Country/com:Code='MM' &#xA;or com:Address/com:Country/com:Code='NA' &#xA;or com:Address/com:Country/com:Code='NR' &#xA;or com:Address/com:Country/com:Code='NP' &#xA;or com:Address/com:Country/com:Code='NL' &#xA;or com:Address/com:Country/com:Code='AN' &#xA;or com:Address/com:Country/com:Code='NC' &#xA;or com:Address/com:Country/com:Code='NZ' &#xA;or com:Address/com:Country/com:Code='NI' &#xA;or com:Address/com:Country/com:Code='NE' &#xA;or com:Address/com:Country/com:Code='NG' &#xA;or com:Address/com:Country/com:Code='NU' &#xA;or com:Address/com:Country/com:Code='NF' &#xA;or com:Address/com:Country/com:Code='MP' &#xA;or com:Address/com:Country/com:Code='NO' &#xA;or com:Address/com:Country/com:Code='OM' &#xA;or com:Address/com:Country/com:Code='PK' &#xA;or com:Address/com:Country/com:Code='PW' &#xA;or com:Address/com:Country/com:Code='PS' &#xA;or com:Address/com:Country/com:Code='PA' &#xA;or com:Address/com:Country/com:Code='PG' &#xA;or com:Address/com:Country/com:Code='PY' &#xA;or com:Address/com:Country/com:Code='PE' &#xA;or com:Address/com:Country/com:Code='PH' &#xA;or com:Address/com:Country/com:Code='PN' &#xA;or com:Address/com:Country/com:Code='PL' &#xA;or com:Address/com:Country/com:Code='PT' &#xA;or com:Address/com:Country/com:Code='PR' &#xA;or com:Address/com:Country/com:Code='QA' &#xA;or com:Address/com:Country/com:Code='RE' &#xA;or com:Address/com:Country/com:Code='RO' &#xA;or com:Address/com:Country/com:Code='RU' &#xA;or com:Address/com:Country/com:Code='RW' &#xA;or com:Address/com:Country/com:Code='SH' &#xA;or com:Address/com:Country/com:Code='KN' &#xA;or com:Address/com:Country/com:Code='LC' &#xA;or com:Address/com:Country/com:Code='PM' &#xA;or com:Address/com:Country/com:Code='VC' &#xA;or com:Address/com:Country/com:Code='WS' &#xA;or com:Address/com:Country/com:Code='SM' &#xA;or com:Address/com:Country/com:Code='ST' &#xA;or com:Address/com:Country/com:Code='SA' &#xA;or com:Address/com:Country/com:Code='SN' &#xA;or com:Address/com:Country/com:Code='CS' &#xA;or com:Address/com:Country/com:Code='SC'&#xA;or com:Address/com:Country/com:Code='SG' &#xA;or com:Address/com:Country/com:Code='SK' &#xA;or com:Address/com:Country/com:Code='SI' &#xA;or com:Address/com:Country/com:Code='SB' &#xA;or com:Address/com:Country/com:Code='SO' &#xA;or com:Address/com:Country/com:Code='ZA' &#xA;or com:Address/com:Country/com:Code='GS' &#xA;or com:Address/com:Country/com:Code='ES' &#xA;or com:Address/com:Country/com:Code='LK' &#xA;or com:Address/com:Country/com:Code='SD' &#xA;or com:Address/com:Country/com:Code='SR' &#xA;or com:Address/com:Country/com:Code='SJ' &#xA;or com:Address/com:Country/com:Code='SZ' &#xA;or com:Address/com:Country/com:Code='SE' &#xA;or com:Address/com:Country/com:Code='CH' &#xA;or com:Address/com:Country/com:Code='SY' &#xA;or com:Address/com:Country/com:Code='TW' &#xA;or com:Address/com:Country/com:Code='TJ' &#xA;or com:Address/com:Country/com:Code='TZ' &#xA;or com:Address/com:Country/com:Code='TH' &#xA;or com:Address/com:Country/com:Code='TL' &#xA;or com:Address/com:Country/com:Code='TG' &#xA;or com:Address/com:Country/com:Code='TK' &#xA;or com:Address/com:Country/com:Code='TO' &#xA;or com:Address/com:Country/com:Code='TT' &#xA;or com:Address/com:Country/com:Code='TN' &#xA;or com:Address/com:Country/com:Code='TR' &#xA;or com:Address/com:Country/com:Code='TM' &#xA;or com:Address/com:Country/com:Code='TC' &#xA;or com:Address/com:Country/com:Code='TV' &#xA;or com:Address/com:Country/com:Code='UG' &#xA;or com:Address/com:Country/com:Code='UA' &#xA;or com:Address/com:Country/com:Code='AE' &#xA;or com:Address/com:Country/com:Code='GB' &#xA;or com:Address/com:Country/com:Code='US' &#xA;or com:Address/com:Country/com:Code='UM' &#xA;or com:Address/com:Country/com:Code='UY' &#xA;or com:Address/com:Country/com:Code='UZ' &#xA;or com:Address/com:Country/com:Code='VU' &#xA;or com:Address/com:Country/com:Code='VE' &#xA;or com:Address/com:Country/com:Code='VN' &#xA;or com:Address/com:Country/com:Code='VG' &#xA;or com:Address/com:Country/com:Code='VI' &#xA;or com:Address/com:Country/com:Code='WF' &#xA;or com:Address/com:Country/com:Code='EH' &#xA;or com:Address/com:Country/com:Code='YE' &#xA;or com:Address/com:Country/com:Code='ZM' &#xA;or com:Address/com:Country/com:Code='ZW'" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:Address/com:Country/com:Code='AF' or com:Address/com:Country/com:Code='AX' or com:Address/com:Country/com:Code='AL' or com:Address/com:Country/com:Code='DZ' or com:Address/com:Country/com:Code='AS' or com:Address/com:Country/com:Code='AD' or com:Address/com:Country/com:Code='AO' or com:Address/com:Country/com:Code='AI' or com:Address/com:Country/com:Code='AQ' or com:Address/com:Country/com:Code='AG' or com:Address/com:Country/com:Code='AR' or com:Address/com:Country/com:Code='AM' or com:Address/com:Country/com:Code='AW' or com:Address/com:Country/com:Code='AU' or com:Address/com:Country/com:Code='AT' or com:Address/com:Country/com:Code='AZ' or com:Address/com:Country/com:Code='BS' or com:Address/com:Country/com:Code='BH' or com:Address/com:Country/com:Code='BD' or com:Address/com:Country/com:Code='BB' or com:Address/com:Country/com:Code='BY' or com:Address/com:Country/com:Code='BE' or com:Address/com:Country/com:Code='BZ' or com:Address/com:Country/com:Code='BJ' or com:Address/com:Country/com:Code='BM' or com:Address/com:Country/com:Code='BT' or com:Address/com:Country/com:Code='BO' or com:Address/com:Country/com:Code='BA' or com:Address/com:Country/com:Code='BW' or com:Address/com:Country/com:Code='BV' or com:Address/com:Country/com:Code='BR' or com:Address/com:Country/com:Code='IO' or com:Address/com:Country/com:Code='BN' or com:Address/com:Country/com:Code='BG' or com:Address/com:Country/com:Code='BF' or com:Address/com:Country/com:Code='BI' or com:Address/com:Country/com:Code='KH' or com:Address/com:Country/com:Code='CM' or com:Address/com:Country/com:Code='CA' or com:Address/com:Country/com:Code='CV' or com:Address/com:Country/com:Code='KY' or com:Address/com:Country/com:Code='CF' or com:Address/com:Country/com:Code='TD' or com:Address/com:Country/com:Code='CL' or com:Address/com:Country/com:Code='CN' or com:Address/com:Country/com:Code='CX' or com:Address/com:Country/com:Code='CC' or com:Address/com:Country/com:Code='CO' or com:Address/com:Country/com:Code='KM' or com:Address/com:Country/com:Code='CG' or com:Address/com:Country/com:Code='CD' or com:Address/com:Country/com:Code='CK' or com:Address/com:Country/com:Code='CR' or com:Address/com:Country/com:Code='CI' or com:Address/com:Country/com:Code='HR' or com:Address/com:Country/com:Code='CU' or com:Address/com:Country/com:Code='CY' or com:Address/com:Country/com:Code='CZ' or com:Address/com:Country/com:Code='DK' or com:Address/com:Country/com:Code='DJ' or com:Address/com:Country/com:Code='DM' or com:Address/com:Country/com:Code='DO' or com:Address/com:Country/com:Code='EC' or com:Address/com:Country/com:Code='EG' or com:Address/com:Country/com:Code='SV' or com:Address/com:Country/com:Code='GQ' or com:Address/com:Country/com:Code='ER' or com:Address/com:Country/com:Code='EE' or com:Address/com:Country/com:Code='ET' or com:Address/com:Country/com:Code='FK' or com:Address/com:Country/com:Code='FO' or com:Address/com:Country/com:Code='FJ' or com:Address/com:Country/com:Code='FI' or com:Address/com:Country/com:Code='FR' or com:Address/com:Country/com:Code='GF' or com:Address/com:Country/com:Code='PF' or com:Address/com:Country/com:Code='TF' or com:Address/com:Country/com:Code='GA' or com:Address/com:Country/com:Code='GM' or com:Address/com:Country/com:Code='GE' or com:Address/com:Country/com:Code='DE' or com:Address/com:Country/com:Code='GH' or com:Address/com:Country/com:Code='GI' or com:Address/com:Country/com:Code='GR' or com:Address/com:Country/com:Code='GL' or com:Address/com:Country/com:Code='GD' or com:Address/com:Country/com:Code='GP' or com:Address/com:Country/com:Code='GU' or com:Address/com:Country/com:Code='GT' or com:Address/com:Country/com:Code='GG' or com:Address/com:Country/com:Code='GN' or com:Address/com:Country/com:Code='GW' or com:Address/com:Country/com:Code='GY' or com:Address/com:Country/com:Code='HT' or com:Address/com:Country/com:Code='HM' or com:Address/com:Country/com:Code='VA' or com:Address/com:Country/com:Code='HN' or com:Address/com:Country/com:Code='HK' or com:Address/com:Country/com:Code='HU' or com:Address/com:Country/com:Code='IS' or com:Address/com:Country/com:Code='IN' or com:Address/com:Country/com:Code='ID' or com:Address/com:Country/com:Code='IR' or com:Address/com:Country/com:Code='IQ' or com:Address/com:Country/com:Code='IE' or com:Address/com:Country/com:Code='IL' or com:Address/com:Country/com:Code='IT' or com:Address/com:Country/com:Code='JM' or com:Address/com:Country/com:Code='JP' or com:Address/com:Country/com:Code='JE' or com:Address/com:Country/com:Code='JO' or com:Address/com:Country/com:Code='KZ' or com:Address/com:Country/com:Code='KE' or com:Address/com:Country/com:Code='KI' or com:Address/com:Country/com:Code='KP' or com:Address/com:Country/com:Code='KR' or com:Address/com:Country/com:Code='KW' or com:Address/com:Country/com:Code='KG' or com:Address/com:Country/com:Code='LA' or com:Address/com:Country/com:Code='LV' or com:Address/com:Country/com:Code='LB' or com:Address/com:Country/com:Code='LS' or com:Address/com:Country/com:Code='LR' or com:Address/com:Country/com:Code='LY' or com:Address/com:Country/com:Code='LI' or com:Address/com:Country/com:Code='LT' or com:Address/com:Country/com:Code='LU' or com:Address/com:Country/com:Code='MO' or com:Address/com:Country/com:Code='MK' or com:Address/com:Country/com:Code='MG' or com:Address/com:Country/com:Code='MW' or com:Address/com:Country/com:Code='MY' or com:Address/com:Country/com:Code='MV' or com:Address/com:Country/com:Code='ML' or com:Address/com:Country/com:Code='MT' or com:Address/com:Country/com:Code='MH' or com:Address/com:Country/com:Code='MQ' or com:Address/com:Country/com:Code='MR' or com:Address/com:Country/com:Code='MU' or com:Address/com:Country/com:Code='YT' or com:Address/com:Country/com:Code='MX' or com:Address/com:Country/com:Code='FM' or com:Address/com:Country/com:Code='MD' or com:Address/com:Country/com:Code='MC' or com:Address/com:Country/com:Code='MN' or com:Address/com:Country/com:Code='MS' or com:Address/com:Country/com:Code='MA' or com:Address/com:Country/com:Code='MZ' or com:Address/com:Country/com:Code='MM' or com:Address/com:Country/com:Code='NA' or com:Address/com:Country/com:Code='NR' or com:Address/com:Country/com:Code='NP' or com:Address/com:Country/com:Code='NL' or com:Address/com:Country/com:Code='AN' or com:Address/com:Country/com:Code='NC' or com:Address/com:Country/com:Code='NZ' or com:Address/com:Country/com:Code='NI' or com:Address/com:Country/com:Code='NE' or com:Address/com:Country/com:Code='NG' or com:Address/com:Country/com:Code='NU' or com:Address/com:Country/com:Code='NF' or com:Address/com:Country/com:Code='MP' or com:Address/com:Country/com:Code='NO' or com:Address/com:Country/com:Code='OM' or com:Address/com:Country/com:Code='PK' or com:Address/com:Country/com:Code='PW' or com:Address/com:Country/com:Code='PS' or com:Address/com:Country/com:Code='PA' or com:Address/com:Country/com:Code='PG' or com:Address/com:Country/com:Code='PY' or com:Address/com:Country/com:Code='PE' or com:Address/com:Country/com:Code='PH' or com:Address/com:Country/com:Code='PN' or com:Address/com:Country/com:Code='PL' or com:Address/com:Country/com:Code='PT' or com:Address/com:Country/com:Code='PR' or com:Address/com:Country/com:Code='QA' or com:Address/com:Country/com:Code='RE' or com:Address/com:Country/com:Code='RO' or com:Address/com:Country/com:Code='RU' or com:Address/com:Country/com:Code='RW' or com:Address/com:Country/com:Code='SH' or com:Address/com:Country/com:Code='KN' or com:Address/com:Country/com:Code='LC' or com:Address/com:Country/com:Code='PM' or com:Address/com:Country/com:Code='VC' or com:Address/com:Country/com:Code='WS' or com:Address/com:Country/com:Code='SM' or com:Address/com:Country/com:Code='ST' or com:Address/com:Country/com:Code='SA' or com:Address/com:Country/com:Code='SN' or com:Address/com:Country/com:Code='CS' or com:Address/com:Country/com:Code='SC' or com:Address/com:Country/com:Code='SG' or com:Address/com:Country/com:Code='SK' or com:Address/com:Country/com:Code='SI' or com:Address/com:Country/com:Code='SB' or com:Address/com:Country/com:Code='SO' or com:Address/com:Country/com:Code='ZA' or com:Address/com:Country/com:Code='GS' or com:Address/com:Country/com:Code='ES' or com:Address/com:Country/com:Code='LK' or com:Address/com:Country/com:Code='SD' or com:Address/com:Country/com:Code='SR' or com:Address/com:Country/com:Code='SJ' or com:Address/com:Country/com:Code='SZ' or com:Address/com:Country/com:Code='SE' or com:Address/com:Country/com:Code='CH' or com:Address/com:Country/com:Code='SY' or com:Address/com:Country/com:Code='TW' or com:Address/com:Country/com:Code='TJ' or com:Address/com:Country/com:Code='TZ' or com:Address/com:Country/com:Code='TH' or com:Address/com:Country/com:Code='TL' or com:Address/com:Country/com:Code='TG' or com:Address/com:Country/com:Code='TK' or com:Address/com:Country/com:Code='TO' or com:Address/com:Country/com:Code='TT' or com:Address/com:Country/com:Code='TN' or com:Address/com:Country/com:Code='TR' or com:Address/com:Country/com:Code='TM' or com:Address/com:Country/com:Code='TC' or com:Address/com:Country/com:Code='TV' or com:Address/com:Country/com:Code='UG' or com:Address/com:Country/com:Code='UA' or com:Address/com:Country/com:Code='AE' or com:Address/com:Country/com:Code='GB' or com:Address/com:Country/com:Code='US' or com:Address/com:Country/com:Code='UM' or com:Address/com:Country/com:Code='UY' or com:Address/com:Country/com:Code='UZ' or com:Address/com:Country/com:Code='VU' or com:Address/com:Country/com:Code='VE' or com:Address/com:Country/com:Code='VN' or com:Address/com:Country/com:Code='VG' or com:Address/com:Country/com:Code='VI' or com:Address/com:Country/com:Code='WF' or com:Address/com:Country/com:Code='EH' or com:Address/com:Country/com:Code='YE' or com:Address/com:Country/com:Code='ZM' or com:Address/com:Country/com:Code='ZW'</pattern>:
   BuyerParty com:Address/com:Country/com:Code should be 2 alpha-numerical characters e.g. ”DK” for Denmark
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M11" />
</xsl:template>
<xsl:template match="com:BuyerParty[com:Address/com:ID='Fakturering']" priority="3999" mode="M11">
<xsl:if test="preceding-sibling::com:BuyerParty[com:Address/com:ID != 'Juridisk'] | following-sibling::com:BuyerParty[com:Address/com:ID != 'Juridisk']">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>preceding-sibling::com:BuyerParty[com:Address/com:ID != 'Juridisk'] | following-sibling::com:BuyerParty[com:Address/com:ID != 'Juridisk']</pattern>:
   BuyerParty com:Address com:ID should have a value of Juridisk or Fakturering, and there should only be one BuyerParty of each type
</error></xsl:if>
<xsl:if test="count(com:Address) &gt;1">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>count(com:Address) &gt;1</pattern>:
   There should only be one Address under BuyerParty, this validation rule is implementable in XML Schema but is not provided as yet.
</error></xsl:if>
<xsl:choose>
<xsl:when test="string-length(com:ID)&gt;0" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(com:ID)&gt;0</pattern>:
   WARNING: there should be some value in ID under BuyerParty
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M11" />
</xsl:template>
<xsl:template match="com:BuyerParty[com:Address/com:ID !='Juridisk' and com:Address/com:ID !='Fakturering']" priority="3998" mode="M11">
<xsl:choose>
<xsl:when test="com:Address/com:ID = 'Juridisk' or com:Address/com:ID = 'Fakturering'" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:Address/com:ID = 'Juridisk' or com:Address/com:ID = 'Fakturering'</pattern>:
   BuyerParty com:Address com:ID should have a value of Juridisk or Fakturering, and there should only be one BuyerParty of each type
</error></xsl:otherwise>
</xsl:choose>
<xsl:if test="count(com:Address) &gt;1">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>count(com:Address) &gt;1</pattern>:
   There should only be one Address under BuyerParty, this validation rule is implementable in XML Schema but is not provided as yet.
</error></xsl:if>
<xsl:choose>
<xsl:when test="string-length(com:ID)&gt;0" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(com:ID)&gt;0</pattern>:
   WARNING: there should be some value in ID under BuyerParty
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="&#xA;   com:Address/com:Country/com:Code='AF'&#xA;or com:Address/com:Country/com:Code='AX'&#xA;or com:Address/com:Country/com:Code='AL' &#xA;or com:Address/com:Country/com:Code='DZ' &#xA;or com:Address/com:Country/com:Code='AS' &#xA;or com:Address/com:Country/com:Code='AD' &#xA;or com:Address/com:Country/com:Code='AO' &#xA;or com:Address/com:Country/com:Code='AI' &#xA;or com:Address/com:Country/com:Code='AQ' &#xA;or com:Address/com:Country/com:Code='AG' &#xA;or com:Address/com:Country/com:Code='AR' &#xA;or com:Address/com:Country/com:Code='AM' &#xA;or com:Address/com:Country/com:Code='AW' &#xA;or com:Address/com:Country/com:Code='AU' &#xA;or com:Address/com:Country/com:Code='AT' &#xA;or com:Address/com:Country/com:Code='AZ' &#xA;or com:Address/com:Country/com:Code='BS' &#xA;or com:Address/com:Country/com:Code='BH' &#xA;or com:Address/com:Country/com:Code='BD' &#xA;or com:Address/com:Country/com:Code='BB' &#xA;or com:Address/com:Country/com:Code='BY' &#xA;or com:Address/com:Country/com:Code='BE' &#xA;or com:Address/com:Country/com:Code='BZ' &#xA;or com:Address/com:Country/com:Code='BJ' &#xA;or com:Address/com:Country/com:Code='BM' &#xA;or com:Address/com:Country/com:Code='BT' &#xA;or com:Address/com:Country/com:Code='BO' &#xA;or com:Address/com:Country/com:Code='BA' &#xA;or com:Address/com:Country/com:Code='BW' &#xA;or com:Address/com:Country/com:Code='BV' &#xA;or com:Address/com:Country/com:Code='BR' &#xA;or com:Address/com:Country/com:Code='IO' &#xA;or com:Address/com:Country/com:Code='BN' &#xA;or com:Address/com:Country/com:Code='BG' &#xA;or com:Address/com:Country/com:Code='BF' &#xA;or com:Address/com:Country/com:Code='BI' &#xA;or com:Address/com:Country/com:Code='KH' &#xA;or com:Address/com:Country/com:Code='CM' &#xA;or com:Address/com:Country/com:Code='CA' &#xA;or com:Address/com:Country/com:Code='CV' &#xA;or com:Address/com:Country/com:Code='KY' &#xA;or com:Address/com:Country/com:Code='CF' &#xA;or com:Address/com:Country/com:Code='TD' &#xA;or com:Address/com:Country/com:Code='CL' &#xA;or com:Address/com:Country/com:Code='CN' &#xA;or com:Address/com:Country/com:Code='CX' &#xA;or com:Address/com:Country/com:Code='CC' &#xA;or com:Address/com:Country/com:Code='CO' &#xA;or com:Address/com:Country/com:Code='KM' &#xA;or com:Address/com:Country/com:Code='CG' &#xA;or com:Address/com:Country/com:Code='CD' &#xA;or com:Address/com:Country/com:Code='CK' &#xA;or com:Address/com:Country/com:Code='CR' &#xA;or com:Address/com:Country/com:Code='CI' &#xA;or com:Address/com:Country/com:Code='HR' &#xA;or com:Address/com:Country/com:Code='CU' &#xA;or com:Address/com:Country/com:Code='CY' &#xA;or com:Address/com:Country/com:Code='CZ' &#xA;or com:Address/com:Country/com:Code='DK' &#xA;or com:Address/com:Country/com:Code='DJ' &#xA;or com:Address/com:Country/com:Code='DM' &#xA;or com:Address/com:Country/com:Code='DO' &#xA;or com:Address/com:Country/com:Code='EC' &#xA;or com:Address/com:Country/com:Code='EG' &#xA;or com:Address/com:Country/com:Code='SV' &#xA;or com:Address/com:Country/com:Code='GQ' &#xA;or com:Address/com:Country/com:Code='ER' &#xA;or com:Address/com:Country/com:Code='EE' &#xA;or com:Address/com:Country/com:Code='ET' &#xA;or com:Address/com:Country/com:Code='FK' &#xA;or com:Address/com:Country/com:Code='FO' &#xA;or com:Address/com:Country/com:Code='FJ' &#xA;or com:Address/com:Country/com:Code='FI' &#xA;or com:Address/com:Country/com:Code='FR' &#xA;or com:Address/com:Country/com:Code='GF' &#xA;or com:Address/com:Country/com:Code='PF' &#xA;or com:Address/com:Country/com:Code='TF' &#xA;or com:Address/com:Country/com:Code='GA' &#xA;or com:Address/com:Country/com:Code='GM' &#xA;or com:Address/com:Country/com:Code='GE' &#xA;or com:Address/com:Country/com:Code='DE' &#xA;or com:Address/com:Country/com:Code='GH' &#xA;or com:Address/com:Country/com:Code='GI' &#xA;or com:Address/com:Country/com:Code='GR' &#xA;or com:Address/com:Country/com:Code='GL' &#xA;or com:Address/com:Country/com:Code='GD' &#xA;or com:Address/com:Country/com:Code='GP' &#xA;or com:Address/com:Country/com:Code='GU' &#xA;or com:Address/com:Country/com:Code='GT' &#xA;or com:Address/com:Country/com:Code='GG' &#xA;or com:Address/com:Country/com:Code='GN' &#xA;or com:Address/com:Country/com:Code='GW' &#xA;or com:Address/com:Country/com:Code='GY' &#xA;or com:Address/com:Country/com:Code='HT' &#xA;or com:Address/com:Country/com:Code='HM' &#xA;or com:Address/com:Country/com:Code='VA' &#xA;or com:Address/com:Country/com:Code='HN' &#xA;or com:Address/com:Country/com:Code='HK' &#xA;or com:Address/com:Country/com:Code='HU' &#xA;or com:Address/com:Country/com:Code='IS' &#xA;or com:Address/com:Country/com:Code='IN' &#xA;or com:Address/com:Country/com:Code='ID' &#xA;or com:Address/com:Country/com:Code='IR' &#xA;or com:Address/com:Country/com:Code='IQ' &#xA;or com:Address/com:Country/com:Code='IE' &#xA;or com:Address/com:Country/com:Code='IL' &#xA;or com:Address/com:Country/com:Code='IT' &#xA;or com:Address/com:Country/com:Code='JM' &#xA;or com:Address/com:Country/com:Code='JP' &#xA;or com:Address/com:Country/com:Code='JE' &#xA;or com:Address/com:Country/com:Code='JO' &#xA;or com:Address/com:Country/com:Code='KZ' &#xA;or com:Address/com:Country/com:Code='KE' &#xA;or com:Address/com:Country/com:Code='KI' &#xA;or com:Address/com:Country/com:Code='KP' &#xA;or com:Address/com:Country/com:Code='KR' &#xA;or com:Address/com:Country/com:Code='KW' &#xA;or com:Address/com:Country/com:Code='KG' &#xA;or com:Address/com:Country/com:Code='LA' &#xA;or com:Address/com:Country/com:Code='LV' &#xA;or com:Address/com:Country/com:Code='LB' &#xA;or com:Address/com:Country/com:Code='LS' &#xA;or com:Address/com:Country/com:Code='LR' &#xA;or com:Address/com:Country/com:Code='LY' &#xA;or com:Address/com:Country/com:Code='LI' &#xA;or com:Address/com:Country/com:Code='LT' &#xA;or com:Address/com:Country/com:Code='LU' &#xA;or com:Address/com:Country/com:Code='MO' &#xA;or com:Address/com:Country/com:Code='MK' &#xA;or com:Address/com:Country/com:Code='MG' &#xA;or com:Address/com:Country/com:Code='MW' &#xA;or com:Address/com:Country/com:Code='MY' &#xA;or com:Address/com:Country/com:Code='MV' &#xA;or com:Address/com:Country/com:Code='ML' &#xA;or com:Address/com:Country/com:Code='MT' &#xA;or com:Address/com:Country/com:Code='MH' &#xA;or com:Address/com:Country/com:Code='MQ' &#xA;or com:Address/com:Country/com:Code='MR' &#xA;or com:Address/com:Country/com:Code='MU' &#xA;or com:Address/com:Country/com:Code='YT' &#xA;or com:Address/com:Country/com:Code='MX' &#xA;or com:Address/com:Country/com:Code='FM' &#xA;or com:Address/com:Country/com:Code='MD' &#xA;or com:Address/com:Country/com:Code='MC' &#xA;or com:Address/com:Country/com:Code='MN' &#xA;or com:Address/com:Country/com:Code='MS' &#xA;or com:Address/com:Country/com:Code='MA' &#xA;or com:Address/com:Country/com:Code='MZ' &#xA;or com:Address/com:Country/com:Code='MM' &#xA;or com:Address/com:Country/com:Code='NA' &#xA;or com:Address/com:Country/com:Code='NR' &#xA;or com:Address/com:Country/com:Code='NP' &#xA;or com:Address/com:Country/com:Code='NL' &#xA;or com:Address/com:Country/com:Code='AN' &#xA;or com:Address/com:Country/com:Code='NC' &#xA;or com:Address/com:Country/com:Code='NZ' &#xA;or com:Address/com:Country/com:Code='NI' &#xA;or com:Address/com:Country/com:Code='NE' &#xA;or com:Address/com:Country/com:Code='NG' &#xA;or com:Address/com:Country/com:Code='NU' &#xA;or com:Address/com:Country/com:Code='NF' &#xA;or com:Address/com:Country/com:Code='MP' &#xA;or com:Address/com:Country/com:Code='NO' &#xA;or com:Address/com:Country/com:Code='OM' &#xA;or com:Address/com:Country/com:Code='PK' &#xA;or com:Address/com:Country/com:Code='PW' &#xA;or com:Address/com:Country/com:Code='PS' &#xA;or com:Address/com:Country/com:Code='PA' &#xA;or com:Address/com:Country/com:Code='PG' &#xA;or com:Address/com:Country/com:Code='PY' &#xA;or com:Address/com:Country/com:Code='PE' &#xA;or com:Address/com:Country/com:Code='PH' &#xA;or com:Address/com:Country/com:Code='PN' &#xA;or com:Address/com:Country/com:Code='PL' &#xA;or com:Address/com:Country/com:Code='PT' &#xA;or com:Address/com:Country/com:Code='PR' &#xA;or com:Address/com:Country/com:Code='QA' &#xA;or com:Address/com:Country/com:Code='RE' &#xA;or com:Address/com:Country/com:Code='RO' &#xA;or com:Address/com:Country/com:Code='RU' &#xA;or com:Address/com:Country/com:Code='RW' &#xA;or com:Address/com:Country/com:Code='SH' &#xA;or com:Address/com:Country/com:Code='KN' &#xA;or com:Address/com:Country/com:Code='LC' &#xA;or com:Address/com:Country/com:Code='PM' &#xA;or com:Address/com:Country/com:Code='VC' &#xA;or com:Address/com:Country/com:Code='WS' &#xA;or com:Address/com:Country/com:Code='SM' &#xA;or com:Address/com:Country/com:Code='ST' &#xA;or com:Address/com:Country/com:Code='SA' &#xA;or com:Address/com:Country/com:Code='SN' &#xA;or com:Address/com:Country/com:Code='CS' &#xA;or com:Address/com:Country/com:Code='SC'&#xA;or com:Address/com:Country/com:Code='SG' &#xA;or com:Address/com:Country/com:Code='SK' &#xA;or com:Address/com:Country/com:Code='SI' &#xA;or com:Address/com:Country/com:Code='SB' &#xA;or com:Address/com:Country/com:Code='SO' &#xA;or com:Address/com:Country/com:Code='ZA' &#xA;or com:Address/com:Country/com:Code='GS' &#xA;or com:Address/com:Country/com:Code='ES' &#xA;or com:Address/com:Country/com:Code='LK' &#xA;or com:Address/com:Country/com:Code='SD' &#xA;or com:Address/com:Country/com:Code='SR' &#xA;or com:Address/com:Country/com:Code='SJ' &#xA;or com:Address/com:Country/com:Code='SZ' &#xA;or com:Address/com:Country/com:Code='SE' &#xA;or com:Address/com:Country/com:Code='CH' &#xA;or com:Address/com:Country/com:Code='SY' &#xA;or com:Address/com:Country/com:Code='TW' &#xA;or com:Address/com:Country/com:Code='TJ' &#xA;or com:Address/com:Country/com:Code='TZ' &#xA;or com:Address/com:Country/com:Code='TH' &#xA;or com:Address/com:Country/com:Code='TL' &#xA;or com:Address/com:Country/com:Code='TG' &#xA;or com:Address/com:Country/com:Code='TK' &#xA;or com:Address/com:Country/com:Code='TO' &#xA;or com:Address/com:Country/com:Code='TT' &#xA;or com:Address/com:Country/com:Code='TN' &#xA;or com:Address/com:Country/com:Code='TR' &#xA;or com:Address/com:Country/com:Code='TM' &#xA;or com:Address/com:Country/com:Code='TC' &#xA;or com:Address/com:Country/com:Code='TV' &#xA;or com:Address/com:Country/com:Code='UG' &#xA;or com:Address/com:Country/com:Code='UA' &#xA;or com:Address/com:Country/com:Code='AE' &#xA;or com:Address/com:Country/com:Code='GB' &#xA;or com:Address/com:Country/com:Code='US' &#xA;or com:Address/com:Country/com:Code='UM' &#xA;or com:Address/com:Country/com:Code='UY' &#xA;or com:Address/com:Country/com:Code='UZ' &#xA;or com:Address/com:Country/com:Code='VU' &#xA;or com:Address/com:Country/com:Code='VE' &#xA;or com:Address/com:Country/com:Code='VN' &#xA;or com:Address/com:Country/com:Code='VG' &#xA;or com:Address/com:Country/com:Code='VI' &#xA;or com:Address/com:Country/com:Code='WF' &#xA;or com:Address/com:Country/com:Code='EH' &#xA;or com:Address/com:Country/com:Code='YE' &#xA;or com:Address/com:Country/com:Code='ZM' &#xA;or com:Address/com:Country/com:Code='ZW'" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:Address/com:Country/com:Code='AF' or com:Address/com:Country/com:Code='AX' or com:Address/com:Country/com:Code='AL' or com:Address/com:Country/com:Code='DZ' or com:Address/com:Country/com:Code='AS' or com:Address/com:Country/com:Code='AD' or com:Address/com:Country/com:Code='AO' or com:Address/com:Country/com:Code='AI' or com:Address/com:Country/com:Code='AQ' or com:Address/com:Country/com:Code='AG' or com:Address/com:Country/com:Code='AR' or com:Address/com:Country/com:Code='AM' or com:Address/com:Country/com:Code='AW' or com:Address/com:Country/com:Code='AU' or com:Address/com:Country/com:Code='AT' or com:Address/com:Country/com:Code='AZ' or com:Address/com:Country/com:Code='BS' or com:Address/com:Country/com:Code='BH' or com:Address/com:Country/com:Code='BD' or com:Address/com:Country/com:Code='BB' or com:Address/com:Country/com:Code='BY' or com:Address/com:Country/com:Code='BE' or com:Address/com:Country/com:Code='BZ' or com:Address/com:Country/com:Code='BJ' or com:Address/com:Country/com:Code='BM' or com:Address/com:Country/com:Code='BT' or com:Address/com:Country/com:Code='BO' or com:Address/com:Country/com:Code='BA' or com:Address/com:Country/com:Code='BW' or com:Address/com:Country/com:Code='BV' or com:Address/com:Country/com:Code='BR' or com:Address/com:Country/com:Code='IO' or com:Address/com:Country/com:Code='BN' or com:Address/com:Country/com:Code='BG' or com:Address/com:Country/com:Code='BF' or com:Address/com:Country/com:Code='BI' or com:Address/com:Country/com:Code='KH' or com:Address/com:Country/com:Code='CM' or com:Address/com:Country/com:Code='CA' or com:Address/com:Country/com:Code='CV' or com:Address/com:Country/com:Code='KY' or com:Address/com:Country/com:Code='CF' or com:Address/com:Country/com:Code='TD' or com:Address/com:Country/com:Code='CL' or com:Address/com:Country/com:Code='CN' or com:Address/com:Country/com:Code='CX' or com:Address/com:Country/com:Code='CC' or com:Address/com:Country/com:Code='CO' or com:Address/com:Country/com:Code='KM' or com:Address/com:Country/com:Code='CG' or com:Address/com:Country/com:Code='CD' or com:Address/com:Country/com:Code='CK' or com:Address/com:Country/com:Code='CR' or com:Address/com:Country/com:Code='CI' or com:Address/com:Country/com:Code='HR' or com:Address/com:Country/com:Code='CU' or com:Address/com:Country/com:Code='CY' or com:Address/com:Country/com:Code='CZ' or com:Address/com:Country/com:Code='DK' or com:Address/com:Country/com:Code='DJ' or com:Address/com:Country/com:Code='DM' or com:Address/com:Country/com:Code='DO' or com:Address/com:Country/com:Code='EC' or com:Address/com:Country/com:Code='EG' or com:Address/com:Country/com:Code='SV' or com:Address/com:Country/com:Code='GQ' or com:Address/com:Country/com:Code='ER' or com:Address/com:Country/com:Code='EE' or com:Address/com:Country/com:Code='ET' or com:Address/com:Country/com:Code='FK' or com:Address/com:Country/com:Code='FO' or com:Address/com:Country/com:Code='FJ' or com:Address/com:Country/com:Code='FI' or com:Address/com:Country/com:Code='FR' or com:Address/com:Country/com:Code='GF' or com:Address/com:Country/com:Code='PF' or com:Address/com:Country/com:Code='TF' or com:Address/com:Country/com:Code='GA' or com:Address/com:Country/com:Code='GM' or com:Address/com:Country/com:Code='GE' or com:Address/com:Country/com:Code='DE' or com:Address/com:Country/com:Code='GH' or com:Address/com:Country/com:Code='GI' or com:Address/com:Country/com:Code='GR' or com:Address/com:Country/com:Code='GL' or com:Address/com:Country/com:Code='GD' or com:Address/com:Country/com:Code='GP' or com:Address/com:Country/com:Code='GU' or com:Address/com:Country/com:Code='GT' or com:Address/com:Country/com:Code='GG' or com:Address/com:Country/com:Code='GN' or com:Address/com:Country/com:Code='GW' or com:Address/com:Country/com:Code='GY' or com:Address/com:Country/com:Code='HT' or com:Address/com:Country/com:Code='HM' or com:Address/com:Country/com:Code='VA' or com:Address/com:Country/com:Code='HN' or com:Address/com:Country/com:Code='HK' or com:Address/com:Country/com:Code='HU' or com:Address/com:Country/com:Code='IS' or com:Address/com:Country/com:Code='IN' or com:Address/com:Country/com:Code='ID' or com:Address/com:Country/com:Code='IR' or com:Address/com:Country/com:Code='IQ' or com:Address/com:Country/com:Code='IE' or com:Address/com:Country/com:Code='IL' or com:Address/com:Country/com:Code='IT' or com:Address/com:Country/com:Code='JM' or com:Address/com:Country/com:Code='JP' or com:Address/com:Country/com:Code='JE' or com:Address/com:Country/com:Code='JO' or com:Address/com:Country/com:Code='KZ' or com:Address/com:Country/com:Code='KE' or com:Address/com:Country/com:Code='KI' or com:Address/com:Country/com:Code='KP' or com:Address/com:Country/com:Code='KR' or com:Address/com:Country/com:Code='KW' or com:Address/com:Country/com:Code='KG' or com:Address/com:Country/com:Code='LA' or com:Address/com:Country/com:Code='LV' or com:Address/com:Country/com:Code='LB' or com:Address/com:Country/com:Code='LS' or com:Address/com:Country/com:Code='LR' or com:Address/com:Country/com:Code='LY' or com:Address/com:Country/com:Code='LI' or com:Address/com:Country/com:Code='LT' or com:Address/com:Country/com:Code='LU' or com:Address/com:Country/com:Code='MO' or com:Address/com:Country/com:Code='MK' or com:Address/com:Country/com:Code='MG' or com:Address/com:Country/com:Code='MW' or com:Address/com:Country/com:Code='MY' or com:Address/com:Country/com:Code='MV' or com:Address/com:Country/com:Code='ML' or com:Address/com:Country/com:Code='MT' or com:Address/com:Country/com:Code='MH' or com:Address/com:Country/com:Code='MQ' or com:Address/com:Country/com:Code='MR' or com:Address/com:Country/com:Code='MU' or com:Address/com:Country/com:Code='YT' or com:Address/com:Country/com:Code='MX' or com:Address/com:Country/com:Code='FM' or com:Address/com:Country/com:Code='MD' or com:Address/com:Country/com:Code='MC' or com:Address/com:Country/com:Code='MN' or com:Address/com:Country/com:Code='MS' or com:Address/com:Country/com:Code='MA' or com:Address/com:Country/com:Code='MZ' or com:Address/com:Country/com:Code='MM' or com:Address/com:Country/com:Code='NA' or com:Address/com:Country/com:Code='NR' or com:Address/com:Country/com:Code='NP' or com:Address/com:Country/com:Code='NL' or com:Address/com:Country/com:Code='AN' or com:Address/com:Country/com:Code='NC' or com:Address/com:Country/com:Code='NZ' or com:Address/com:Country/com:Code='NI' or com:Address/com:Country/com:Code='NE' or com:Address/com:Country/com:Code='NG' or com:Address/com:Country/com:Code='NU' or com:Address/com:Country/com:Code='NF' or com:Address/com:Country/com:Code='MP' or com:Address/com:Country/com:Code='NO' or com:Address/com:Country/com:Code='OM' or com:Address/com:Country/com:Code='PK' or com:Address/com:Country/com:Code='PW' or com:Address/com:Country/com:Code='PS' or com:Address/com:Country/com:Code='PA' or com:Address/com:Country/com:Code='PG' or com:Address/com:Country/com:Code='PY' or com:Address/com:Country/com:Code='PE' or com:Address/com:Country/com:Code='PH' or com:Address/com:Country/com:Code='PN' or com:Address/com:Country/com:Code='PL' or com:Address/com:Country/com:Code='PT' or com:Address/com:Country/com:Code='PR' or com:Address/com:Country/com:Code='QA' or com:Address/com:Country/com:Code='RE' or com:Address/com:Country/com:Code='RO' or com:Address/com:Country/com:Code='RU' or com:Address/com:Country/com:Code='RW' or com:Address/com:Country/com:Code='SH' or com:Address/com:Country/com:Code='KN' or com:Address/com:Country/com:Code='LC' or com:Address/com:Country/com:Code='PM' or com:Address/com:Country/com:Code='VC' or com:Address/com:Country/com:Code='WS' or com:Address/com:Country/com:Code='SM' or com:Address/com:Country/com:Code='ST' or com:Address/com:Country/com:Code='SA' or com:Address/com:Country/com:Code='SN' or com:Address/com:Country/com:Code='CS' or com:Address/com:Country/com:Code='SC' or com:Address/com:Country/com:Code='SG' or com:Address/com:Country/com:Code='SK' or com:Address/com:Country/com:Code='SI' or com:Address/com:Country/com:Code='SB' or com:Address/com:Country/com:Code='SO' or com:Address/com:Country/com:Code='ZA' or com:Address/com:Country/com:Code='GS' or com:Address/com:Country/com:Code='ES' or com:Address/com:Country/com:Code='LK' or com:Address/com:Country/com:Code='SD' or com:Address/com:Country/com:Code='SR' or com:Address/com:Country/com:Code='SJ' or com:Address/com:Country/com:Code='SZ' or com:Address/com:Country/com:Code='SE' or com:Address/com:Country/com:Code='CH' or com:Address/com:Country/com:Code='SY' or com:Address/com:Country/com:Code='TW' or com:Address/com:Country/com:Code='TJ' or com:Address/com:Country/com:Code='TZ' or com:Address/com:Country/com:Code='TH' or com:Address/com:Country/com:Code='TL' or com:Address/com:Country/com:Code='TG' or com:Address/com:Country/com:Code='TK' or com:Address/com:Country/com:Code='TO' or com:Address/com:Country/com:Code='TT' or com:Address/com:Country/com:Code='TN' or com:Address/com:Country/com:Code='TR' or com:Address/com:Country/com:Code='TM' or com:Address/com:Country/com:Code='TC' or com:Address/com:Country/com:Code='TV' or com:Address/com:Country/com:Code='UG' or com:Address/com:Country/com:Code='UA' or com:Address/com:Country/com:Code='AE' or com:Address/com:Country/com:Code='GB' or com:Address/com:Country/com:Code='US' or com:Address/com:Country/com:Code='UM' or com:Address/com:Country/com:Code='UY' or com:Address/com:Country/com:Code='UZ' or com:Address/com:Country/com:Code='VU' or com:Address/com:Country/com:Code='VE' or com:Address/com:Country/com:Code='VN' or com:Address/com:Country/com:Code='VG' or com:Address/com:Country/com:Code='VI' or com:Address/com:Country/com:Code='WF' or com:Address/com:Country/com:Code='EH' or com:Address/com:Country/com:Code='YE' or com:Address/com:Country/com:Code='ZM' or com:Address/com:Country/com:Code='ZW'</pattern>:
   BuyerParty com:Address/com:Country/com:Code should be 2 alpha-numerical characters e.g. ”DK” for Denmark
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M11" />
</xsl:template>
<xsl:template match="text()" priority="-1" mode="M11" />
<xsl:template match="com:SellerParty[com:Address/com:ID='Vareafsendelse'][parent::pie:Invoice or parent::pcm:Invoice]" priority="4000" mode="M12">
<xsl:choose>
<xsl:when test="&#xA;   com:Address/com:Country/com:Code='AF'&#xA;or com:Address/com:Country/com:Code='AX'&#xA;or com:Address/com:Country/com:Code='AL' &#xA;or com:Address/com:Country/com:Code='DZ' &#xA;or com:Address/com:Country/com:Code='AS' &#xA;or com:Address/com:Country/com:Code='AD' &#xA;or com:Address/com:Country/com:Code='AO' &#xA;or com:Address/com:Country/com:Code='AI' &#xA;or com:Address/com:Country/com:Code='AQ' &#xA;or com:Address/com:Country/com:Code='AG' &#xA;or com:Address/com:Country/com:Code='AR' &#xA;or com:Address/com:Country/com:Code='AM' &#xA;or com:Address/com:Country/com:Code='AW' &#xA;or com:Address/com:Country/com:Code='AU' &#xA;or com:Address/com:Country/com:Code='AT' &#xA;or com:Address/com:Country/com:Code='AZ' &#xA;or com:Address/com:Country/com:Code='BS' &#xA;or com:Address/com:Country/com:Code='BH' &#xA;or com:Address/com:Country/com:Code='BD' &#xA;or com:Address/com:Country/com:Code='BB' &#xA;or com:Address/com:Country/com:Code='BY' &#xA;or com:Address/com:Country/com:Code='BE' &#xA;or com:Address/com:Country/com:Code='BZ' &#xA;or com:Address/com:Country/com:Code='BJ' &#xA;or com:Address/com:Country/com:Code='BM' &#xA;or com:Address/com:Country/com:Code='BT' &#xA;or com:Address/com:Country/com:Code='BO' &#xA;or com:Address/com:Country/com:Code='BA' &#xA;or com:Address/com:Country/com:Code='BW' &#xA;or com:Address/com:Country/com:Code='BV' &#xA;or com:Address/com:Country/com:Code='BR' &#xA;or com:Address/com:Country/com:Code='IO' &#xA;or com:Address/com:Country/com:Code='BN' &#xA;or com:Address/com:Country/com:Code='BG' &#xA;or com:Address/com:Country/com:Code='BF' &#xA;or com:Address/com:Country/com:Code='BI' &#xA;or com:Address/com:Country/com:Code='KH' &#xA;or com:Address/com:Country/com:Code='CM' &#xA;or com:Address/com:Country/com:Code='CA' &#xA;or com:Address/com:Country/com:Code='CV' &#xA;or com:Address/com:Country/com:Code='KY' &#xA;or com:Address/com:Country/com:Code='CF' &#xA;or com:Address/com:Country/com:Code='TD' &#xA;or com:Address/com:Country/com:Code='CL' &#xA;or com:Address/com:Country/com:Code='CN' &#xA;or com:Address/com:Country/com:Code='CX' &#xA;or com:Address/com:Country/com:Code='CC' &#xA;or com:Address/com:Country/com:Code='CO' &#xA;or com:Address/com:Country/com:Code='KM' &#xA;or com:Address/com:Country/com:Code='CG' &#xA;or com:Address/com:Country/com:Code='CD' &#xA;or com:Address/com:Country/com:Code='CK' &#xA;or com:Address/com:Country/com:Code='CR' &#xA;or com:Address/com:Country/com:Code='CI' &#xA;or com:Address/com:Country/com:Code='HR' &#xA;or com:Address/com:Country/com:Code='CU' &#xA;or com:Address/com:Country/com:Code='CY' &#xA;or com:Address/com:Country/com:Code='CZ' &#xA;or com:Address/com:Country/com:Code='DK' &#xA;or com:Address/com:Country/com:Code='DJ' &#xA;or com:Address/com:Country/com:Code='DM' &#xA;or com:Address/com:Country/com:Code='DO' &#xA;or com:Address/com:Country/com:Code='EC' &#xA;or com:Address/com:Country/com:Code='EG' &#xA;or com:Address/com:Country/com:Code='SV' &#xA;or com:Address/com:Country/com:Code='GQ' &#xA;or com:Address/com:Country/com:Code='ER' &#xA;or com:Address/com:Country/com:Code='EE' &#xA;or com:Address/com:Country/com:Code='ET' &#xA;or com:Address/com:Country/com:Code='FK' &#xA;or com:Address/com:Country/com:Code='FO' &#xA;or com:Address/com:Country/com:Code='FJ' &#xA;or com:Address/com:Country/com:Code='FI' &#xA;or com:Address/com:Country/com:Code='FR' &#xA;or com:Address/com:Country/com:Code='GF' &#xA;or com:Address/com:Country/com:Code='PF' &#xA;or com:Address/com:Country/com:Code='TF' &#xA;or com:Address/com:Country/com:Code='GA' &#xA;or com:Address/com:Country/com:Code='GM' &#xA;or com:Address/com:Country/com:Code='GE' &#xA;or com:Address/com:Country/com:Code='DE' &#xA;or com:Address/com:Country/com:Code='GH' &#xA;or com:Address/com:Country/com:Code='GI' &#xA;or com:Address/com:Country/com:Code='GR' &#xA;or com:Address/com:Country/com:Code='GL' &#xA;or com:Address/com:Country/com:Code='GD' &#xA;or com:Address/com:Country/com:Code='GP' &#xA;or com:Address/com:Country/com:Code='GU' &#xA;or com:Address/com:Country/com:Code='GT' &#xA;or com:Address/com:Country/com:Code='GG' &#xA;or com:Address/com:Country/com:Code='GN' &#xA;or com:Address/com:Country/com:Code='GW' &#xA;or com:Address/com:Country/com:Code='GY' &#xA;or com:Address/com:Country/com:Code='HT' &#xA;or com:Address/com:Country/com:Code='HM' &#xA;or com:Address/com:Country/com:Code='VA' &#xA;or com:Address/com:Country/com:Code='HN' &#xA;or com:Address/com:Country/com:Code='HK' &#xA;or com:Address/com:Country/com:Code='HU' &#xA;or com:Address/com:Country/com:Code='IS' &#xA;or com:Address/com:Country/com:Code='IN' &#xA;or com:Address/com:Country/com:Code='ID' &#xA;or com:Address/com:Country/com:Code='IR' &#xA;or com:Address/com:Country/com:Code='IQ' &#xA;or com:Address/com:Country/com:Code='IE' &#xA;or com:Address/com:Country/com:Code='IL' &#xA;or com:Address/com:Country/com:Code='IT' &#xA;or com:Address/com:Country/com:Code='JM' &#xA;or com:Address/com:Country/com:Code='JP' &#xA;or com:Address/com:Country/com:Code='JE' &#xA;or com:Address/com:Country/com:Code='JO' &#xA;or com:Address/com:Country/com:Code='KZ' &#xA;or com:Address/com:Country/com:Code='KE' &#xA;or com:Address/com:Country/com:Code='KI' &#xA;or com:Address/com:Country/com:Code='KP' &#xA;or com:Address/com:Country/com:Code='KR' &#xA;or com:Address/com:Country/com:Code='KW' &#xA;or com:Address/com:Country/com:Code='KG' &#xA;or com:Address/com:Country/com:Code='LA' &#xA;or com:Address/com:Country/com:Code='LV' &#xA;or com:Address/com:Country/com:Code='LB' &#xA;or com:Address/com:Country/com:Code='LS' &#xA;or com:Address/com:Country/com:Code='LR' &#xA;or com:Address/com:Country/com:Code='LY' &#xA;or com:Address/com:Country/com:Code='LI' &#xA;or com:Address/com:Country/com:Code='LT' &#xA;or com:Address/com:Country/com:Code='LU' &#xA;or com:Address/com:Country/com:Code='MO' &#xA;or com:Address/com:Country/com:Code='MK' &#xA;or com:Address/com:Country/com:Code='MG' &#xA;or com:Address/com:Country/com:Code='MW' &#xA;or com:Address/com:Country/com:Code='MY' &#xA;or com:Address/com:Country/com:Code='MV' &#xA;or com:Address/com:Country/com:Code='ML' &#xA;or com:Address/com:Country/com:Code='MT' &#xA;or com:Address/com:Country/com:Code='MH' &#xA;or com:Address/com:Country/com:Code='MQ' &#xA;or com:Address/com:Country/com:Code='MR' &#xA;or com:Address/com:Country/com:Code='MU' &#xA;or com:Address/com:Country/com:Code='YT' &#xA;or com:Address/com:Country/com:Code='MX' &#xA;or com:Address/com:Country/com:Code='FM' &#xA;or com:Address/com:Country/com:Code='MD' &#xA;or com:Address/com:Country/com:Code='MC' &#xA;or com:Address/com:Country/com:Code='MN' &#xA;or com:Address/com:Country/com:Code='MS' &#xA;or com:Address/com:Country/com:Code='MA' &#xA;or com:Address/com:Country/com:Code='MZ' &#xA;or com:Address/com:Country/com:Code='MM' &#xA;or com:Address/com:Country/com:Code='NA' &#xA;or com:Address/com:Country/com:Code='NR' &#xA;or com:Address/com:Country/com:Code='NP' &#xA;or com:Address/com:Country/com:Code='NL' &#xA;or com:Address/com:Country/com:Code='AN' &#xA;or com:Address/com:Country/com:Code='NC' &#xA;or com:Address/com:Country/com:Code='NZ' &#xA;or com:Address/com:Country/com:Code='NI' &#xA;or com:Address/com:Country/com:Code='NE' &#xA;or com:Address/com:Country/com:Code='NG' &#xA;or com:Address/com:Country/com:Code='NU' &#xA;or com:Address/com:Country/com:Code='NF' &#xA;or com:Address/com:Country/com:Code='MP' &#xA;or com:Address/com:Country/com:Code='NO' &#xA;or com:Address/com:Country/com:Code='OM' &#xA;or com:Address/com:Country/com:Code='PK' &#xA;or com:Address/com:Country/com:Code='PW' &#xA;or com:Address/com:Country/com:Code='PS' &#xA;or com:Address/com:Country/com:Code='PA' &#xA;or com:Address/com:Country/com:Code='PG' &#xA;or com:Address/com:Country/com:Code='PY' &#xA;or com:Address/com:Country/com:Code='PE' &#xA;or com:Address/com:Country/com:Code='PH' &#xA;or com:Address/com:Country/com:Code='PN' &#xA;or com:Address/com:Country/com:Code='PL' &#xA;or com:Address/com:Country/com:Code='PT' &#xA;or com:Address/com:Country/com:Code='PR' &#xA;or com:Address/com:Country/com:Code='QA' &#xA;or com:Address/com:Country/com:Code='RE' &#xA;or com:Address/com:Country/com:Code='RO' &#xA;or com:Address/com:Country/com:Code='RU' &#xA;or com:Address/com:Country/com:Code='RW' &#xA;or com:Address/com:Country/com:Code='SH' &#xA;or com:Address/com:Country/com:Code='KN' &#xA;or com:Address/com:Country/com:Code='LC' &#xA;or com:Address/com:Country/com:Code='PM' &#xA;or com:Address/com:Country/com:Code='VC' &#xA;or com:Address/com:Country/com:Code='WS' &#xA;or com:Address/com:Country/com:Code='SM' &#xA;or com:Address/com:Country/com:Code='ST' &#xA;or com:Address/com:Country/com:Code='SA' &#xA;or com:Address/com:Country/com:Code='SN' &#xA;or com:Address/com:Country/com:Code='CS' &#xA;or com:Address/com:Country/com:Code='SC'&#xA;or com:Address/com:Country/com:Code='SG' &#xA;or com:Address/com:Country/com:Code='SK' &#xA;or com:Address/com:Country/com:Code='SI' &#xA;or com:Address/com:Country/com:Code='SB' &#xA;or com:Address/com:Country/com:Code='SO' &#xA;or com:Address/com:Country/com:Code='ZA' &#xA;or com:Address/com:Country/com:Code='GS' &#xA;or com:Address/com:Country/com:Code='ES' &#xA;or com:Address/com:Country/com:Code='LK' &#xA;or com:Address/com:Country/com:Code='SD' &#xA;or com:Address/com:Country/com:Code='SR' &#xA;or com:Address/com:Country/com:Code='SJ' &#xA;or com:Address/com:Country/com:Code='SZ' &#xA;or com:Address/com:Country/com:Code='SE' &#xA;or com:Address/com:Country/com:Code='CH' &#xA;or com:Address/com:Country/com:Code='SY' &#xA;or com:Address/com:Country/com:Code='TW' &#xA;or com:Address/com:Country/com:Code='TJ' &#xA;or com:Address/com:Country/com:Code='TZ' &#xA;or com:Address/com:Country/com:Code='TH' &#xA;or com:Address/com:Country/com:Code='TL' &#xA;or com:Address/com:Country/com:Code='TG' &#xA;or com:Address/com:Country/com:Code='TK' &#xA;or com:Address/com:Country/com:Code='TO' &#xA;or com:Address/com:Country/com:Code='TT' &#xA;or com:Address/com:Country/com:Code='TN' &#xA;or com:Address/com:Country/com:Code='TR' &#xA;or com:Address/com:Country/com:Code='TM' &#xA;or com:Address/com:Country/com:Code='TC' &#xA;or com:Address/com:Country/com:Code='TV' &#xA;or com:Address/com:Country/com:Code='UG' &#xA;or com:Address/com:Country/com:Code='UA' &#xA;or com:Address/com:Country/com:Code='AE' &#xA;or com:Address/com:Country/com:Code='GB' &#xA;or com:Address/com:Country/com:Code='US' &#xA;or com:Address/com:Country/com:Code='UM' &#xA;or com:Address/com:Country/com:Code='UY' &#xA;or com:Address/com:Country/com:Code='UZ' &#xA;or com:Address/com:Country/com:Code='VU' &#xA;or com:Address/com:Country/com:Code='VE' &#xA;or com:Address/com:Country/com:Code='VN' &#xA;or com:Address/com:Country/com:Code='VG' &#xA;or com:Address/com:Country/com:Code='VI' &#xA;or com:Address/com:Country/com:Code='WF' &#xA;or com:Address/com:Country/com:Code='EH' &#xA;or com:Address/com:Country/com:Code='YE' &#xA;or com:Address/com:Country/com:Code='ZM' &#xA;or com:Address/com:Country/com:Code='ZW'&#xA;or ((string-length(com:Address/com:Country/com:Code)=7) and contains(com:Address/com:Country/com:Code,'-'))&#xA;" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:Address/com:Country/com:Code='AF' or com:Address/com:Country/com:Code='AX' or com:Address/com:Country/com:Code='AL' or com:Address/com:Country/com:Code='DZ' or com:Address/com:Country/com:Code='AS' or com:Address/com:Country/com:Code='AD' or com:Address/com:Country/com:Code='AO' or com:Address/com:Country/com:Code='AI' or com:Address/com:Country/com:Code='AQ' or com:Address/com:Country/com:Code='AG' or com:Address/com:Country/com:Code='AR' or com:Address/com:Country/com:Code='AM' or com:Address/com:Country/com:Code='AW' or com:Address/com:Country/com:Code='AU' or com:Address/com:Country/com:Code='AT' or com:Address/com:Country/com:Code='AZ' or com:Address/com:Country/com:Code='BS' or com:Address/com:Country/com:Code='BH' or com:Address/com:Country/com:Code='BD' or com:Address/com:Country/com:Code='BB' or com:Address/com:Country/com:Code='BY' or com:Address/com:Country/com:Code='BE' or com:Address/com:Country/com:Code='BZ' or com:Address/com:Country/com:Code='BJ' or com:Address/com:Country/com:Code='BM' or com:Address/com:Country/com:Code='BT' or com:Address/com:Country/com:Code='BO' or com:Address/com:Country/com:Code='BA' or com:Address/com:Country/com:Code='BW' or com:Address/com:Country/com:Code='BV' or com:Address/com:Country/com:Code='BR' or com:Address/com:Country/com:Code='IO' or com:Address/com:Country/com:Code='BN' or com:Address/com:Country/com:Code='BG' or com:Address/com:Country/com:Code='BF' or com:Address/com:Country/com:Code='BI' or com:Address/com:Country/com:Code='KH' or com:Address/com:Country/com:Code='CM' or com:Address/com:Country/com:Code='CA' or com:Address/com:Country/com:Code='CV' or com:Address/com:Country/com:Code='KY' or com:Address/com:Country/com:Code='CF' or com:Address/com:Country/com:Code='TD' or com:Address/com:Country/com:Code='CL' or com:Address/com:Country/com:Code='CN' or com:Address/com:Country/com:Code='CX' or com:Address/com:Country/com:Code='CC' or com:Address/com:Country/com:Code='CO' or com:Address/com:Country/com:Code='KM' or com:Address/com:Country/com:Code='CG' or com:Address/com:Country/com:Code='CD' or com:Address/com:Country/com:Code='CK' or com:Address/com:Country/com:Code='CR' or com:Address/com:Country/com:Code='CI' or com:Address/com:Country/com:Code='HR' or com:Address/com:Country/com:Code='CU' or com:Address/com:Country/com:Code='CY' or com:Address/com:Country/com:Code='CZ' or com:Address/com:Country/com:Code='DK' or com:Address/com:Country/com:Code='DJ' or com:Address/com:Country/com:Code='DM' or com:Address/com:Country/com:Code='DO' or com:Address/com:Country/com:Code='EC' or com:Address/com:Country/com:Code='EG' or com:Address/com:Country/com:Code='SV' or com:Address/com:Country/com:Code='GQ' or com:Address/com:Country/com:Code='ER' or com:Address/com:Country/com:Code='EE' or com:Address/com:Country/com:Code='ET' or com:Address/com:Country/com:Code='FK' or com:Address/com:Country/com:Code='FO' or com:Address/com:Country/com:Code='FJ' or com:Address/com:Country/com:Code='FI' or com:Address/com:Country/com:Code='FR' or com:Address/com:Country/com:Code='GF' or com:Address/com:Country/com:Code='PF' or com:Address/com:Country/com:Code='TF' or com:Address/com:Country/com:Code='GA' or com:Address/com:Country/com:Code='GM' or com:Address/com:Country/com:Code='GE' or com:Address/com:Country/com:Code='DE' or com:Address/com:Country/com:Code='GH' or com:Address/com:Country/com:Code='GI' or com:Address/com:Country/com:Code='GR' or com:Address/com:Country/com:Code='GL' or com:Address/com:Country/com:Code='GD' or com:Address/com:Country/com:Code='GP' or com:Address/com:Country/com:Code='GU' or com:Address/com:Country/com:Code='GT' or com:Address/com:Country/com:Code='GG' or com:Address/com:Country/com:Code='GN' or com:Address/com:Country/com:Code='GW' or com:Address/com:Country/com:Code='GY' or com:Address/com:Country/com:Code='HT' or com:Address/com:Country/com:Code='HM' or com:Address/com:Country/com:Code='VA' or com:Address/com:Country/com:Code='HN' or com:Address/com:Country/com:Code='HK' or com:Address/com:Country/com:Code='HU' or com:Address/com:Country/com:Code='IS' or com:Address/com:Country/com:Code='IN' or com:Address/com:Country/com:Code='ID' or com:Address/com:Country/com:Code='IR' or com:Address/com:Country/com:Code='IQ' or com:Address/com:Country/com:Code='IE' or com:Address/com:Country/com:Code='IL' or com:Address/com:Country/com:Code='IT' or com:Address/com:Country/com:Code='JM' or com:Address/com:Country/com:Code='JP' or com:Address/com:Country/com:Code='JE' or com:Address/com:Country/com:Code='JO' or com:Address/com:Country/com:Code='KZ' or com:Address/com:Country/com:Code='KE' or com:Address/com:Country/com:Code='KI' or com:Address/com:Country/com:Code='KP' or com:Address/com:Country/com:Code='KR' or com:Address/com:Country/com:Code='KW' or com:Address/com:Country/com:Code='KG' or com:Address/com:Country/com:Code='LA' or com:Address/com:Country/com:Code='LV' or com:Address/com:Country/com:Code='LB' or com:Address/com:Country/com:Code='LS' or com:Address/com:Country/com:Code='LR' or com:Address/com:Country/com:Code='LY' or com:Address/com:Country/com:Code='LI' or com:Address/com:Country/com:Code='LT' or com:Address/com:Country/com:Code='LU' or com:Address/com:Country/com:Code='MO' or com:Address/com:Country/com:Code='MK' or com:Address/com:Country/com:Code='MG' or com:Address/com:Country/com:Code='MW' or com:Address/com:Country/com:Code='MY' or com:Address/com:Country/com:Code='MV' or com:Address/com:Country/com:Code='ML' or com:Address/com:Country/com:Code='MT' or com:Address/com:Country/com:Code='MH' or com:Address/com:Country/com:Code='MQ' or com:Address/com:Country/com:Code='MR' or com:Address/com:Country/com:Code='MU' or com:Address/com:Country/com:Code='YT' or com:Address/com:Country/com:Code='MX' or com:Address/com:Country/com:Code='FM' or com:Address/com:Country/com:Code='MD' or com:Address/com:Country/com:Code='MC' or com:Address/com:Country/com:Code='MN' or com:Address/com:Country/com:Code='MS' or com:Address/com:Country/com:Code='MA' or com:Address/com:Country/com:Code='MZ' or com:Address/com:Country/com:Code='MM' or com:Address/com:Country/com:Code='NA' or com:Address/com:Country/com:Code='NR' or com:Address/com:Country/com:Code='NP' or com:Address/com:Country/com:Code='NL' or com:Address/com:Country/com:Code='AN' or com:Address/com:Country/com:Code='NC' or com:Address/com:Country/com:Code='NZ' or com:Address/com:Country/com:Code='NI' or com:Address/com:Country/com:Code='NE' or com:Address/com:Country/com:Code='NG' or com:Address/com:Country/com:Code='NU' or com:Address/com:Country/com:Code='NF' or com:Address/com:Country/com:Code='MP' or com:Address/com:Country/com:Code='NO' or com:Address/com:Country/com:Code='OM' or com:Address/com:Country/com:Code='PK' or com:Address/com:Country/com:Code='PW' or com:Address/com:Country/com:Code='PS' or com:Address/com:Country/com:Code='PA' or com:Address/com:Country/com:Code='PG' or com:Address/com:Country/com:Code='PY' or com:Address/com:Country/com:Code='PE' or com:Address/com:Country/com:Code='PH' or com:Address/com:Country/com:Code='PN' or com:Address/com:Country/com:Code='PL' or com:Address/com:Country/com:Code='PT' or com:Address/com:Country/com:Code='PR' or com:Address/com:Country/com:Code='QA' or com:Address/com:Country/com:Code='RE' or com:Address/com:Country/com:Code='RO' or com:Address/com:Country/com:Code='RU' or com:Address/com:Country/com:Code='RW' or com:Address/com:Country/com:Code='SH' or com:Address/com:Country/com:Code='KN' or com:Address/com:Country/com:Code='LC' or com:Address/com:Country/com:Code='PM' or com:Address/com:Country/com:Code='VC' or com:Address/com:Country/com:Code='WS' or com:Address/com:Country/com:Code='SM' or com:Address/com:Country/com:Code='ST' or com:Address/com:Country/com:Code='SA' or com:Address/com:Country/com:Code='SN' or com:Address/com:Country/com:Code='CS' or com:Address/com:Country/com:Code='SC' or com:Address/com:Country/com:Code='SG' or com:Address/com:Country/com:Code='SK' or com:Address/com:Country/com:Code='SI' or com:Address/com:Country/com:Code='SB' or com:Address/com:Country/com:Code='SO' or com:Address/com:Country/com:Code='ZA' or com:Address/com:Country/com:Code='GS' or com:Address/com:Country/com:Code='ES' or com:Address/com:Country/com:Code='LK' or com:Address/com:Country/com:Code='SD' or com:Address/com:Country/com:Code='SR' or com:Address/com:Country/com:Code='SJ' or com:Address/com:Country/com:Code='SZ' or com:Address/com:Country/com:Code='SE' or com:Address/com:Country/com:Code='CH' or com:Address/com:Country/com:Code='SY' or com:Address/com:Country/com:Code='TW' or com:Address/com:Country/com:Code='TJ' or com:Address/com:Country/com:Code='TZ' or com:Address/com:Country/com:Code='TH' or com:Address/com:Country/com:Code='TL' or com:Address/com:Country/com:Code='TG' or com:Address/com:Country/com:Code='TK' or com:Address/com:Country/com:Code='TO' or com:Address/com:Country/com:Code='TT' or com:Address/com:Country/com:Code='TN' or com:Address/com:Country/com:Code='TR' or com:Address/com:Country/com:Code='TM' or com:Address/com:Country/com:Code='TC' or com:Address/com:Country/com:Code='TV' or com:Address/com:Country/com:Code='UG' or com:Address/com:Country/com:Code='UA' or com:Address/com:Country/com:Code='AE' or com:Address/com:Country/com:Code='GB' or com:Address/com:Country/com:Code='US' or com:Address/com:Country/com:Code='UM' or com:Address/com:Country/com:Code='UY' or com:Address/com:Country/com:Code='UZ' or com:Address/com:Country/com:Code='VU' or com:Address/com:Country/com:Code='VE' or com:Address/com:Country/com:Code='VN' or com:Address/com:Country/com:Code='VG' or com:Address/com:Country/com:Code='VI' or com:Address/com:Country/com:Code='WF' or com:Address/com:Country/com:Code='EH' or com:Address/com:Country/com:Code='YE' or com:Address/com:Country/com:Code='ZM' or com:Address/com:Country/com:Code='ZW' or ((string-length(com:Address/com:Country/com:Code)=7) and contains(com:Address/com:Country/com:Code,'-'))</pattern>:
   SellerParty com:Address/com:Country/com:Code should be 2 alpha-numerical characters e.g. ”DK” for Denmark
</error></xsl:otherwise>
</xsl:choose>
<xsl:if test="preceding-sibling::com:SellerParty[com:ID != 'Betaling'] | following-sibling::com:SellerParty[com:ID != 'Betaling']">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>preceding-sibling::com:SellerParty[com:ID != 'Betaling'] | following-sibling::com:SellerParty[com:ID != 'Betaling']</pattern>:
   SellerParty com:Address com:ID should have a value of Vareafsendelse or Betaling, and there should only be one SellerParty of each type
</error></xsl:if>
<xsl:choose>
<xsl:when test="com:Address/com:CityName" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:Address/com:CityName</pattern>:
   There must be an Address.CityName in SellerParty
</error></xsl:otherwise>
</xsl:choose>
<xsl:if test="com:Address/com:Country[not(com:Code)]">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:Address/com:Country[not(com:Code)]</pattern>:
   There must be an Code in Address.Country in SellerParty
</error></xsl:if>
<xsl:choose>
<xsl:when test="string-length(com:ID)&gt;0" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(com:ID)&gt;0</pattern>:
   WARNING: ID in SellerParty should have content
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="string-length(com:ID) &gt; 0" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(com:ID) &gt; 0</pattern>:
   The ID of the faktura should contain a value
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="count(PartyName)&lt;2" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>count(PartyName)&lt;2</pattern>:
   There must be a SellerParty and it must have no more than one partyname.
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M12" />
</xsl:template>
<xsl:template match="com:SellerParty[com:Address/com:ID='Betaling'][/pie:Invoice or /pcm:Invoice]" priority="3999" mode="M12">
<xsl:if test="preceding-sibling::com:SellerParty[com:Address/com:ID != 'Vareafsendelse'] | following-sibling::com:SellerParty[com:Address/com:ID != 'Vareafsendelse']">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>preceding-sibling::com:SellerParty[com:Address/com:ID != 'Vareafsendelse'] | following-sibling::com:SellerParty[com:Address/com:ID != 'Vareafsendelse']</pattern>:
   SellerParty com:Address com:ID should have a value of Vareafsendelse or Betaling, and there should only be one SellerParty of each type
</error></xsl:if>
<xsl:choose>
<xsl:when test="&#xA;   com:Address/com:Country/com:Code='AF'&#xA;or com:Address/com:Country/com:Code='AX'&#xA;or com:Address/com:Country/com:Code='AL' &#xA;or com:Address/com:Country/com:Code='DZ' &#xA;or com:Address/com:Country/com:Code='AS' &#xA;or com:Address/com:Country/com:Code='AD' &#xA;or com:Address/com:Country/com:Code='AO' &#xA;or com:Address/com:Country/com:Code='AI' &#xA;or com:Address/com:Country/com:Code='AQ' &#xA;or com:Address/com:Country/com:Code='AG' &#xA;or com:Address/com:Country/com:Code='AR' &#xA;or com:Address/com:Country/com:Code='AM' &#xA;or com:Address/com:Country/com:Code='AW' &#xA;or com:Address/com:Country/com:Code='AU' &#xA;or com:Address/com:Country/com:Code='AT' &#xA;or com:Address/com:Country/com:Code='AZ' &#xA;or com:Address/com:Country/com:Code='BS' &#xA;or com:Address/com:Country/com:Code='BH' &#xA;or com:Address/com:Country/com:Code='BD' &#xA;or com:Address/com:Country/com:Code='BB' &#xA;or com:Address/com:Country/com:Code='BY' &#xA;or com:Address/com:Country/com:Code='BE' &#xA;or com:Address/com:Country/com:Code='BZ' &#xA;or com:Address/com:Country/com:Code='BJ' &#xA;or com:Address/com:Country/com:Code='BM' &#xA;or com:Address/com:Country/com:Code='BT' &#xA;or com:Address/com:Country/com:Code='BO' &#xA;or com:Address/com:Country/com:Code='BA' &#xA;or com:Address/com:Country/com:Code='BW' &#xA;or com:Address/com:Country/com:Code='BV' &#xA;or com:Address/com:Country/com:Code='BR' &#xA;or com:Address/com:Country/com:Code='IO' &#xA;or com:Address/com:Country/com:Code='BN' &#xA;or com:Address/com:Country/com:Code='BG' &#xA;or com:Address/com:Country/com:Code='BF' &#xA;or com:Address/com:Country/com:Code='BI' &#xA;or com:Address/com:Country/com:Code='KH' &#xA;or com:Address/com:Country/com:Code='CM' &#xA;or com:Address/com:Country/com:Code='CA' &#xA;or com:Address/com:Country/com:Code='CV' &#xA;or com:Address/com:Country/com:Code='KY' &#xA;or com:Address/com:Country/com:Code='CF' &#xA;or com:Address/com:Country/com:Code='TD' &#xA;or com:Address/com:Country/com:Code='CL' &#xA;or com:Address/com:Country/com:Code='CN' &#xA;or com:Address/com:Country/com:Code='CX' &#xA;or com:Address/com:Country/com:Code='CC' &#xA;or com:Address/com:Country/com:Code='CO' &#xA;or com:Address/com:Country/com:Code='KM' &#xA;or com:Address/com:Country/com:Code='CG' &#xA;or com:Address/com:Country/com:Code='CD' &#xA;or com:Address/com:Country/com:Code='CK' &#xA;or com:Address/com:Country/com:Code='CR' &#xA;or com:Address/com:Country/com:Code='CI' &#xA;or com:Address/com:Country/com:Code='HR' &#xA;or com:Address/com:Country/com:Code='CU' &#xA;or com:Address/com:Country/com:Code='CY' &#xA;or com:Address/com:Country/com:Code='CZ' &#xA;or com:Address/com:Country/com:Code='DK' &#xA;or com:Address/com:Country/com:Code='DJ' &#xA;or com:Address/com:Country/com:Code='DM' &#xA;or com:Address/com:Country/com:Code='DO' &#xA;or com:Address/com:Country/com:Code='EC' &#xA;or com:Address/com:Country/com:Code='EG' &#xA;or com:Address/com:Country/com:Code='SV' &#xA;or com:Address/com:Country/com:Code='GQ' &#xA;or com:Address/com:Country/com:Code='ER' &#xA;or com:Address/com:Country/com:Code='EE' &#xA;or com:Address/com:Country/com:Code='ET' &#xA;or com:Address/com:Country/com:Code='FK' &#xA;or com:Address/com:Country/com:Code='FO' &#xA;or com:Address/com:Country/com:Code='FJ' &#xA;or com:Address/com:Country/com:Code='FI' &#xA;or com:Address/com:Country/com:Code='FR' &#xA;or com:Address/com:Country/com:Code='GF' &#xA;or com:Address/com:Country/com:Code='PF' &#xA;or com:Address/com:Country/com:Code='TF' &#xA;or com:Address/com:Country/com:Code='GA' &#xA;or com:Address/com:Country/com:Code='GM' &#xA;or com:Address/com:Country/com:Code='GE' &#xA;or com:Address/com:Country/com:Code='DE' &#xA;or com:Address/com:Country/com:Code='GH' &#xA;or com:Address/com:Country/com:Code='GI' &#xA;or com:Address/com:Country/com:Code='GR' &#xA;or com:Address/com:Country/com:Code='GL' &#xA;or com:Address/com:Country/com:Code='GD' &#xA;or com:Address/com:Country/com:Code='GP' &#xA;or com:Address/com:Country/com:Code='GU' &#xA;or com:Address/com:Country/com:Code='GT' &#xA;or com:Address/com:Country/com:Code='GG' &#xA;or com:Address/com:Country/com:Code='GN' &#xA;or com:Address/com:Country/com:Code='GW' &#xA;or com:Address/com:Country/com:Code='GY' &#xA;or com:Address/com:Country/com:Code='HT' &#xA;or com:Address/com:Country/com:Code='HM' &#xA;or com:Address/com:Country/com:Code='VA' &#xA;or com:Address/com:Country/com:Code='HN' &#xA;or com:Address/com:Country/com:Code='HK' &#xA;or com:Address/com:Country/com:Code='HU' &#xA;or com:Address/com:Country/com:Code='IS' &#xA;or com:Address/com:Country/com:Code='IN' &#xA;or com:Address/com:Country/com:Code='ID' &#xA;or com:Address/com:Country/com:Code='IR' &#xA;or com:Address/com:Country/com:Code='IQ' &#xA;or com:Address/com:Country/com:Code='IE' &#xA;or com:Address/com:Country/com:Code='IL' &#xA;or com:Address/com:Country/com:Code='IT' &#xA;or com:Address/com:Country/com:Code='JM' &#xA;or com:Address/com:Country/com:Code='JP' &#xA;or com:Address/com:Country/com:Code='JE' &#xA;or com:Address/com:Country/com:Code='JO' &#xA;or com:Address/com:Country/com:Code='KZ' &#xA;or com:Address/com:Country/com:Code='KE' &#xA;or com:Address/com:Country/com:Code='KI' &#xA;or com:Address/com:Country/com:Code='KP' &#xA;or com:Address/com:Country/com:Code='KR' &#xA;or com:Address/com:Country/com:Code='KW' &#xA;or com:Address/com:Country/com:Code='KG' &#xA;or com:Address/com:Country/com:Code='LA' &#xA;or com:Address/com:Country/com:Code='LV' &#xA;or com:Address/com:Country/com:Code='LB' &#xA;or com:Address/com:Country/com:Code='LS' &#xA;or com:Address/com:Country/com:Code='LR' &#xA;or com:Address/com:Country/com:Code='LY' &#xA;or com:Address/com:Country/com:Code='LI' &#xA;or com:Address/com:Country/com:Code='LT' &#xA;or com:Address/com:Country/com:Code='LU' &#xA;or com:Address/com:Country/com:Code='MO' &#xA;or com:Address/com:Country/com:Code='MK' &#xA;or com:Address/com:Country/com:Code='MG' &#xA;or com:Address/com:Country/com:Code='MW' &#xA;or com:Address/com:Country/com:Code='MY' &#xA;or com:Address/com:Country/com:Code='MV' &#xA;or com:Address/com:Country/com:Code='ML' &#xA;or com:Address/com:Country/com:Code='MT' &#xA;or com:Address/com:Country/com:Code='MH' &#xA;or com:Address/com:Country/com:Code='MQ' &#xA;or com:Address/com:Country/com:Code='MR' &#xA;or com:Address/com:Country/com:Code='MU' &#xA;or com:Address/com:Country/com:Code='YT' &#xA;or com:Address/com:Country/com:Code='MX' &#xA;or com:Address/com:Country/com:Code='FM' &#xA;or com:Address/com:Country/com:Code='MD' &#xA;or com:Address/com:Country/com:Code='MC' &#xA;or com:Address/com:Country/com:Code='MN' &#xA;or com:Address/com:Country/com:Code='MS' &#xA;or com:Address/com:Country/com:Code='MA' &#xA;or com:Address/com:Country/com:Code='MZ' &#xA;or com:Address/com:Country/com:Code='MM' &#xA;or com:Address/com:Country/com:Code='NA' &#xA;or com:Address/com:Country/com:Code='NR' &#xA;or com:Address/com:Country/com:Code='NP' &#xA;or com:Address/com:Country/com:Code='NL' &#xA;or com:Address/com:Country/com:Code='AN' &#xA;or com:Address/com:Country/com:Code='NC' &#xA;or com:Address/com:Country/com:Code='NZ' &#xA;or com:Address/com:Country/com:Code='NI' &#xA;or com:Address/com:Country/com:Code='NE' &#xA;or com:Address/com:Country/com:Code='NG' &#xA;or com:Address/com:Country/com:Code='NU' &#xA;or com:Address/com:Country/com:Code='NF' &#xA;or com:Address/com:Country/com:Code='MP' &#xA;or com:Address/com:Country/com:Code='NO' &#xA;or com:Address/com:Country/com:Code='OM' &#xA;or com:Address/com:Country/com:Code='PK' &#xA;or com:Address/com:Country/com:Code='PW' &#xA;or com:Address/com:Country/com:Code='PS' &#xA;or com:Address/com:Country/com:Code='PA' &#xA;or com:Address/com:Country/com:Code='PG' &#xA;or com:Address/com:Country/com:Code='PY' &#xA;or com:Address/com:Country/com:Code='PE' &#xA;or com:Address/com:Country/com:Code='PH' &#xA;or com:Address/com:Country/com:Code='PN' &#xA;or com:Address/com:Country/com:Code='PL' &#xA;or com:Address/com:Country/com:Code='PT' &#xA;or com:Address/com:Country/com:Code='PR' &#xA;or com:Address/com:Country/com:Code='QA' &#xA;or com:Address/com:Country/com:Code='RE' &#xA;or com:Address/com:Country/com:Code='RO' &#xA;or com:Address/com:Country/com:Code='RU' &#xA;or com:Address/com:Country/com:Code='RW' &#xA;or com:Address/com:Country/com:Code='SH' &#xA;or com:Address/com:Country/com:Code='KN' &#xA;or com:Address/com:Country/com:Code='LC' &#xA;or com:Address/com:Country/com:Code='PM' &#xA;or com:Address/com:Country/com:Code='VC' &#xA;or com:Address/com:Country/com:Code='WS' &#xA;or com:Address/com:Country/com:Code='SM' &#xA;or com:Address/com:Country/com:Code='ST' &#xA;or com:Address/com:Country/com:Code='SA' &#xA;or com:Address/com:Country/com:Code='SN' &#xA;or com:Address/com:Country/com:Code='CS' &#xA;or com:Address/com:Country/com:Code='SC'&#xA;or com:Address/com:Country/com:Code='SG' &#xA;or com:Address/com:Country/com:Code='SK' &#xA;or com:Address/com:Country/com:Code='SI' &#xA;or com:Address/com:Country/com:Code='SB' &#xA;or com:Address/com:Country/com:Code='SO' &#xA;or com:Address/com:Country/com:Code='ZA' &#xA;or com:Address/com:Country/com:Code='GS' &#xA;or com:Address/com:Country/com:Code='ES' &#xA;or com:Address/com:Country/com:Code='LK' &#xA;or com:Address/com:Country/com:Code='SD' &#xA;or com:Address/com:Country/com:Code='SR' &#xA;or com:Address/com:Country/com:Code='SJ' &#xA;or com:Address/com:Country/com:Code='SZ' &#xA;or com:Address/com:Country/com:Code='SE' &#xA;or com:Address/com:Country/com:Code='CH' &#xA;or com:Address/com:Country/com:Code='SY' &#xA;or com:Address/com:Country/com:Code='TW' &#xA;or com:Address/com:Country/com:Code='TJ' &#xA;or com:Address/com:Country/com:Code='TZ' &#xA;or com:Address/com:Country/com:Code='TH' &#xA;or com:Address/com:Country/com:Code='TL' &#xA;or com:Address/com:Country/com:Code='TG' &#xA;or com:Address/com:Country/com:Code='TK' &#xA;or com:Address/com:Country/com:Code='TO' &#xA;or com:Address/com:Country/com:Code='TT' &#xA;or com:Address/com:Country/com:Code='TN' &#xA;or com:Address/com:Country/com:Code='TR' &#xA;or com:Address/com:Country/com:Code='TM' &#xA;or com:Address/com:Country/com:Code='TC' &#xA;or com:Address/com:Country/com:Code='TV' &#xA;or com:Address/com:Country/com:Code='UG' &#xA;or com:Address/com:Country/com:Code='UA' &#xA;or com:Address/com:Country/com:Code='AE' &#xA;or com:Address/com:Country/com:Code='GB' &#xA;or com:Address/com:Country/com:Code='US' &#xA;or com:Address/com:Country/com:Code='UM' &#xA;or com:Address/com:Country/com:Code='UY' &#xA;or com:Address/com:Country/com:Code='UZ' &#xA;or com:Address/com:Country/com:Code='VU' &#xA;or com:Address/com:Country/com:Code='VE' &#xA;or com:Address/com:Country/com:Code='VN' &#xA;or com:Address/com:Country/com:Code='VG' &#xA;or com:Address/com:Country/com:Code='VI' &#xA;or com:Address/com:Country/com:Code='WF' &#xA;or com:Address/com:Country/com:Code='EH' &#xA;or com:Address/com:Country/com:Code='YE' &#xA;or com:Address/com:Country/com:Code='ZM' &#xA;or com:Address/com:Country/com:Code='ZW'&#xA;or ((string-length(com:Address/com:Country/com:Code)=7) and contains(com:Address/com:Country/com:Code,'-'))&#xA;" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:Address/com:Country/com:Code='AF' or com:Address/com:Country/com:Code='AX' or com:Address/com:Country/com:Code='AL' or com:Address/com:Country/com:Code='DZ' or com:Address/com:Country/com:Code='AS' or com:Address/com:Country/com:Code='AD' or com:Address/com:Country/com:Code='AO' or com:Address/com:Country/com:Code='AI' or com:Address/com:Country/com:Code='AQ' or com:Address/com:Country/com:Code='AG' or com:Address/com:Country/com:Code='AR' or com:Address/com:Country/com:Code='AM' or com:Address/com:Country/com:Code='AW' or com:Address/com:Country/com:Code='AU' or com:Address/com:Country/com:Code='AT' or com:Address/com:Country/com:Code='AZ' or com:Address/com:Country/com:Code='BS' or com:Address/com:Country/com:Code='BH' or com:Address/com:Country/com:Code='BD' or com:Address/com:Country/com:Code='BB' or com:Address/com:Country/com:Code='BY' or com:Address/com:Country/com:Code='BE' or com:Address/com:Country/com:Code='BZ' or com:Address/com:Country/com:Code='BJ' or com:Address/com:Country/com:Code='BM' or com:Address/com:Country/com:Code='BT' or com:Address/com:Country/com:Code='BO' or com:Address/com:Country/com:Code='BA' or com:Address/com:Country/com:Code='BW' or com:Address/com:Country/com:Code='BV' or com:Address/com:Country/com:Code='BR' or com:Address/com:Country/com:Code='IO' or com:Address/com:Country/com:Code='BN' or com:Address/com:Country/com:Code='BG' or com:Address/com:Country/com:Code='BF' or com:Address/com:Country/com:Code='BI' or com:Address/com:Country/com:Code='KH' or com:Address/com:Country/com:Code='CM' or com:Address/com:Country/com:Code='CA' or com:Address/com:Country/com:Code='CV' or com:Address/com:Country/com:Code='KY' or com:Address/com:Country/com:Code='CF' or com:Address/com:Country/com:Code='TD' or com:Address/com:Country/com:Code='CL' or com:Address/com:Country/com:Code='CN' or com:Address/com:Country/com:Code='CX' or com:Address/com:Country/com:Code='CC' or com:Address/com:Country/com:Code='CO' or com:Address/com:Country/com:Code='KM' or com:Address/com:Country/com:Code='CG' or com:Address/com:Country/com:Code='CD' or com:Address/com:Country/com:Code='CK' or com:Address/com:Country/com:Code='CR' or com:Address/com:Country/com:Code='CI' or com:Address/com:Country/com:Code='HR' or com:Address/com:Country/com:Code='CU' or com:Address/com:Country/com:Code='CY' or com:Address/com:Country/com:Code='CZ' or com:Address/com:Country/com:Code='DK' or com:Address/com:Country/com:Code='DJ' or com:Address/com:Country/com:Code='DM' or com:Address/com:Country/com:Code='DO' or com:Address/com:Country/com:Code='EC' or com:Address/com:Country/com:Code='EG' or com:Address/com:Country/com:Code='SV' or com:Address/com:Country/com:Code='GQ' or com:Address/com:Country/com:Code='ER' or com:Address/com:Country/com:Code='EE' or com:Address/com:Country/com:Code='ET' or com:Address/com:Country/com:Code='FK' or com:Address/com:Country/com:Code='FO' or com:Address/com:Country/com:Code='FJ' or com:Address/com:Country/com:Code='FI' or com:Address/com:Country/com:Code='FR' or com:Address/com:Country/com:Code='GF' or com:Address/com:Country/com:Code='PF' or com:Address/com:Country/com:Code='TF' or com:Address/com:Country/com:Code='GA' or com:Address/com:Country/com:Code='GM' or com:Address/com:Country/com:Code='GE' or com:Address/com:Country/com:Code='DE' or com:Address/com:Country/com:Code='GH' or com:Address/com:Country/com:Code='GI' or com:Address/com:Country/com:Code='GR' or com:Address/com:Country/com:Code='GL' or com:Address/com:Country/com:Code='GD' or com:Address/com:Country/com:Code='GP' or com:Address/com:Country/com:Code='GU' or com:Address/com:Country/com:Code='GT' or com:Address/com:Country/com:Code='GG' or com:Address/com:Country/com:Code='GN' or com:Address/com:Country/com:Code='GW' or com:Address/com:Country/com:Code='GY' or com:Address/com:Country/com:Code='HT' or com:Address/com:Country/com:Code='HM' or com:Address/com:Country/com:Code='VA' or com:Address/com:Country/com:Code='HN' or com:Address/com:Country/com:Code='HK' or com:Address/com:Country/com:Code='HU' or com:Address/com:Country/com:Code='IS' or com:Address/com:Country/com:Code='IN' or com:Address/com:Country/com:Code='ID' or com:Address/com:Country/com:Code='IR' or com:Address/com:Country/com:Code='IQ' or com:Address/com:Country/com:Code='IE' or com:Address/com:Country/com:Code='IL' or com:Address/com:Country/com:Code='IT' or com:Address/com:Country/com:Code='JM' or com:Address/com:Country/com:Code='JP' or com:Address/com:Country/com:Code='JE' or com:Address/com:Country/com:Code='JO' or com:Address/com:Country/com:Code='KZ' or com:Address/com:Country/com:Code='KE' or com:Address/com:Country/com:Code='KI' or com:Address/com:Country/com:Code='KP' or com:Address/com:Country/com:Code='KR' or com:Address/com:Country/com:Code='KW' or com:Address/com:Country/com:Code='KG' or com:Address/com:Country/com:Code='LA' or com:Address/com:Country/com:Code='LV' or com:Address/com:Country/com:Code='LB' or com:Address/com:Country/com:Code='LS' or com:Address/com:Country/com:Code='LR' or com:Address/com:Country/com:Code='LY' or com:Address/com:Country/com:Code='LI' or com:Address/com:Country/com:Code='LT' or com:Address/com:Country/com:Code='LU' or com:Address/com:Country/com:Code='MO' or com:Address/com:Country/com:Code='MK' or com:Address/com:Country/com:Code='MG' or com:Address/com:Country/com:Code='MW' or com:Address/com:Country/com:Code='MY' or com:Address/com:Country/com:Code='MV' or com:Address/com:Country/com:Code='ML' or com:Address/com:Country/com:Code='MT' or com:Address/com:Country/com:Code='MH' or com:Address/com:Country/com:Code='MQ' or com:Address/com:Country/com:Code='MR' or com:Address/com:Country/com:Code='MU' or com:Address/com:Country/com:Code='YT' or com:Address/com:Country/com:Code='MX' or com:Address/com:Country/com:Code='FM' or com:Address/com:Country/com:Code='MD' or com:Address/com:Country/com:Code='MC' or com:Address/com:Country/com:Code='MN' or com:Address/com:Country/com:Code='MS' or com:Address/com:Country/com:Code='MA' or com:Address/com:Country/com:Code='MZ' or com:Address/com:Country/com:Code='MM' or com:Address/com:Country/com:Code='NA' or com:Address/com:Country/com:Code='NR' or com:Address/com:Country/com:Code='NP' or com:Address/com:Country/com:Code='NL' or com:Address/com:Country/com:Code='AN' or com:Address/com:Country/com:Code='NC' or com:Address/com:Country/com:Code='NZ' or com:Address/com:Country/com:Code='NI' or com:Address/com:Country/com:Code='NE' or com:Address/com:Country/com:Code='NG' or com:Address/com:Country/com:Code='NU' or com:Address/com:Country/com:Code='NF' or com:Address/com:Country/com:Code='MP' or com:Address/com:Country/com:Code='NO' or com:Address/com:Country/com:Code='OM' or com:Address/com:Country/com:Code='PK' or com:Address/com:Country/com:Code='PW' or com:Address/com:Country/com:Code='PS' or com:Address/com:Country/com:Code='PA' or com:Address/com:Country/com:Code='PG' or com:Address/com:Country/com:Code='PY' or com:Address/com:Country/com:Code='PE' or com:Address/com:Country/com:Code='PH' or com:Address/com:Country/com:Code='PN' or com:Address/com:Country/com:Code='PL' or com:Address/com:Country/com:Code='PT' or com:Address/com:Country/com:Code='PR' or com:Address/com:Country/com:Code='QA' or com:Address/com:Country/com:Code='RE' or com:Address/com:Country/com:Code='RO' or com:Address/com:Country/com:Code='RU' or com:Address/com:Country/com:Code='RW' or com:Address/com:Country/com:Code='SH' or com:Address/com:Country/com:Code='KN' or com:Address/com:Country/com:Code='LC' or com:Address/com:Country/com:Code='PM' or com:Address/com:Country/com:Code='VC' or com:Address/com:Country/com:Code='WS' or com:Address/com:Country/com:Code='SM' or com:Address/com:Country/com:Code='ST' or com:Address/com:Country/com:Code='SA' or com:Address/com:Country/com:Code='SN' or com:Address/com:Country/com:Code='CS' or com:Address/com:Country/com:Code='SC' or com:Address/com:Country/com:Code='SG' or com:Address/com:Country/com:Code='SK' or com:Address/com:Country/com:Code='SI' or com:Address/com:Country/com:Code='SB' or com:Address/com:Country/com:Code='SO' or com:Address/com:Country/com:Code='ZA' or com:Address/com:Country/com:Code='GS' or com:Address/com:Country/com:Code='ES' or com:Address/com:Country/com:Code='LK' or com:Address/com:Country/com:Code='SD' or com:Address/com:Country/com:Code='SR' or com:Address/com:Country/com:Code='SJ' or com:Address/com:Country/com:Code='SZ' or com:Address/com:Country/com:Code='SE' or com:Address/com:Country/com:Code='CH' or com:Address/com:Country/com:Code='SY' or com:Address/com:Country/com:Code='TW' or com:Address/com:Country/com:Code='TJ' or com:Address/com:Country/com:Code='TZ' or com:Address/com:Country/com:Code='TH' or com:Address/com:Country/com:Code='TL' or com:Address/com:Country/com:Code='TG' or com:Address/com:Country/com:Code='TK' or com:Address/com:Country/com:Code='TO' or com:Address/com:Country/com:Code='TT' or com:Address/com:Country/com:Code='TN' or com:Address/com:Country/com:Code='TR' or com:Address/com:Country/com:Code='TM' or com:Address/com:Country/com:Code='TC' or com:Address/com:Country/com:Code='TV' or com:Address/com:Country/com:Code='UG' or com:Address/com:Country/com:Code='UA' or com:Address/com:Country/com:Code='AE' or com:Address/com:Country/com:Code='GB' or com:Address/com:Country/com:Code='US' or com:Address/com:Country/com:Code='UM' or com:Address/com:Country/com:Code='UY' or com:Address/com:Country/com:Code='UZ' or com:Address/com:Country/com:Code='VU' or com:Address/com:Country/com:Code='VE' or com:Address/com:Country/com:Code='VN' or com:Address/com:Country/com:Code='VG' or com:Address/com:Country/com:Code='VI' or com:Address/com:Country/com:Code='WF' or com:Address/com:Country/com:Code='EH' or com:Address/com:Country/com:Code='YE' or com:Address/com:Country/com:Code='ZM' or com:Address/com:Country/com:Code='ZW' or ((string-length(com:Address/com:Country/com:Code)=7) and contains(com:Address/com:Country/com:Code,'-'))</pattern>:
   SellerParty com:Address/com:Country/com:Code should be 2 alpha-numerical characters e.g. ”DK” for Denmark or the land code and the area code of the land as defined in ISO 3166-2
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="com:Address/com:CityName" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:Address/com:CityName</pattern>:
   There must be an Address.CityName in SellerParty
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="com:Address/com:Country/com:Code" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:Address/com:Country/com:Code</pattern>:
   There must be an Address.Country.Code in SellerParty
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="string-length(com:ID)&gt;0" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(com:ID)&gt;0</pattern>:
   WARNING: ID in SellerParty should have content
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="string-length(com:ID) &gt; 0" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(com:ID) &gt; 0</pattern>:
   The ID of the faktura should contain a value
</error></xsl:otherwise>
</xsl:choose>
<xsl:if test="preceding-sibling::com:SellerParty[com:Address/com:ID != 'Vareafsendelse'] | following-sibling::com:SellerParty[com:Address/com:ID != 'Vareafsendelse']">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>preceding-sibling::com:SellerParty[com:Address/com:ID != 'Vareafsendelse'] | following-sibling::com:SellerParty[com:Address/com:ID != 'Vareafsendelse']</pattern>:
   SellerParty com:Address com:ID should have a value of Vareafsendelse or Betaling, and there should only be one SellerParty of each type
</error></xsl:if>
<xsl:choose>
<xsl:when test="count(PartyName)&lt;2" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>count(PartyName)&lt;2</pattern>:
   There must be a SellerParty and it must have no more than one partyname.
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M12" />
</xsl:template>
<xsl:template match="com:SellerParty[com:Address/com:ID !='Vareafsendelse'][com:Address/com:ID !='Betaling']&#xA;[/pie:Invoice or /pcm:Invoice]" priority="3998" mode="M12">
<xsl:choose>
<xsl:when test="com:Address/com:ID ='Vareafsendelse' or com:Address/com:ID ='Betaling'" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:Address/com:ID ='Vareafsendelse' or com:Address/com:ID ='Betaling'</pattern>:
   SellerParty com:Address com:ID should have a value of Vareafsendelse or Betaling, and there should only be one SellerParty of each type
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M12" />
</xsl:template>
<xsl:template match="text()" priority="-1" mode="M12" />
<xsl:template match="*[@schemeID]" priority="4000" mode="M13">
<xsl:if test="@schemeID='EAN' and string-length(.) != 13">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>@schemeID='EAN' and string-length(.) != 13</pattern>:
   WARNING: EAN numbers are 13 digits in length
</error></xsl:if>
<xsl:if test="@schemeID='EAN' and . != (. + 1) - 1">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>@schemeID='EAN' and . != (. + 1) - 1</pattern>:
   WARNING: EAN numbers are 13 digits in length
</error></xsl:if>
<xsl:if test="@schemeID='EAN' and substring(.,13,1)!=0 and ((((10 - substring((substring(.,1,1) * 1 + substring(.,2,1) * 3) + (substring(.,3,1) * 1 + substring(.,4,1) * 3) + (substring(.,5,1) * 1 + substring(.,6,1) * 3) + (substring(.,7,1) * 1 + substring(.,8,1) * 3) + (substring(.,9,1) * 1 + substring(.,10,1) * 3) + (substring(.,11,1) * 1 + substring(.,12,1) * 3),string-length((substring(.,1,1) * 1 + substring(.,2,1) * 3) + (substring(.,3,1) * 1 + substring(.,4,1) * 3) + (substring(.,5,1) * 1 + substring(.,6,1) * 3) + (substring(.,7,1) * 1 + substring(.,8,1) * 3) + (substring(.,9,1) * 1 + substring(.,10,1) * 3) + (substring(.,11,1) * 1 + substring(.,12,1) * 3)),1)) + ((substring(.,1,1) * 1 + substring(.,2,1) * 3) + (substring(.,3,1) * 1 + substring(.,4,1) * 3) + (substring(.,5,1) * 1 + substring(.,6,1) * 3) + (substring(.,7,1) * 1 + substring(.,8,1) * 3) + (substring(.,9,1) * 1 + substring(.,10,1) * 3) + (substring(.,11,1) * 1 + substring(.,12,1) * 3))) - ((substring(.,1,1) * 1 + substring(.,2,1) * 3) + (substring(.,3,1) * 1 + substring(.,4,1) * 3) + (substring(.,5,1) * 1 + substring(.,6,1) * 3) + (substring(.,7,1) * 1 + substring(.,8,1) * 3) + (substring(.,9,1) * 1 + substring(.,10,1) * 3) + (substring(.,11,1) * 1 + substring(.,12,1) * 3))) != substring(.,13,1) )">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>@schemeID='EAN' and substring(.,13,1)!=0 and ((((10 - substring((substring(.,1,1) * 1 + substring(.,2,1) * 3) + (substring(.,3,1) * 1 + substring(.,4,1) * 3) + (substring(.,5,1) * 1 + substring(.,6,1) * 3) + (substring(.,7,1) * 1 + substring(.,8,1) * 3) + (substring(.,9,1) * 1 + substring(.,10,1) * 3) + (substring(.,11,1) * 1 + substring(.,12,1) * 3),string-length((substring(.,1,1) * 1 + substring(.,2,1) * 3) + (substring(.,3,1) * 1 + substring(.,4,1) * 3) + (substring(.,5,1) * 1 + substring(.,6,1) * 3) + (substring(.,7,1) * 1 + substring(.,8,1) * 3) + (substring(.,9,1) * 1 + substring(.,10,1) * 3) + (substring(.,11,1) * 1 + substring(.,12,1) * 3)),1)) + ((substring(.,1,1) * 1 + substring(.,2,1) * 3) + (substring(.,3,1) * 1 + substring(.,4,1) * 3) + (substring(.,5,1) * 1 + substring(.,6,1) * 3) + (substring(.,7,1) * 1 + substring(.,8,1) * 3) + (substring(.,9,1) * 1 + substring(.,10,1) * 3) + (substring(.,11,1) * 1 + substring(.,12,1) * 3))) - ((substring(.,1,1) * 1 + substring(.,2,1) * 3) + (substring(.,3,1) * 1 + substring(.,4,1) * 3) + (substring(.,5,1) * 1 + substring(.,6,1) * 3) + (substring(.,7,1) * 1 + substring(.,8,1) * 3) + (substring(.,9,1) * 1 + substring(.,10,1) * 3) + (substring(.,11,1) * 1 + substring(.,12,1) * 3))) != substring(.,13,1) )</pattern>:
   there is an improperly formatted EAN number.
</error></xsl:if>
<xsl:if test="@schemeID='EAN' and substring(.,13,1) =0 and substring((substring(.,1,1) * 1 + substring(.,2,1) * 3) + (substring(.,3,1) * 1 + substring(.,4,1) * 3) + (substring(.,5,1) * 1 + substring(.,6,1) * 3) + (substring(.,7,1) * 1 + substring(.,8,1) * 3) + (substring(.,9,1) * 1 + substring(.,10,1) * 3) + (substring(.,11,1) * 1 + substring(.,12,1) * 3),string-length((substring(.,1,1) * 1 + substring(.,2,1) * 3) + (substring(.,3,1) * 1 + substring(.,4,1) * 3) + (substring(.,5,1) * 1 + substring(.,6,1) * 3) + (substring(.,7,1) * 1 + substring(.,8,1) * 3) + (substring(.,9,1) * 1 + substring(.,10,1) * 3) + (substring(.,11,1) * 1 + substring(.,12,1) * 3)),1) != 0">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>@schemeID='EAN' and substring(.,13,1) =0 and substring((substring(.,1,1) * 1 + substring(.,2,1) * 3) + (substring(.,3,1) * 1 + substring(.,4,1) * 3) + (substring(.,5,1) * 1 + substring(.,6,1) * 3) + (substring(.,7,1) * 1 + substring(.,8,1) * 3) + (substring(.,9,1) * 1 + substring(.,10,1) * 3) + (substring(.,11,1) * 1 + substring(.,12,1) * 3),string-length((substring(.,1,1) * 1 + substring(.,2,1) * 3) + (substring(.,3,1) * 1 + substring(.,4,1) * 3) + (substring(.,5,1) * 1 + substring(.,6,1) * 3) + (substring(.,7,1) * 1 + substring(.,8,1) * 3) + (substring(.,9,1) * 1 + substring(.,10,1) * 3) + (substring(.,11,1) * 1 + substring(.,12,1) * 3)),1) != 0</pattern>:
   there is an improperly formatted EAN number.
</error></xsl:if>
<xsl:if test="@schemeID='CVR' and string-length(.) != 8">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>@schemeID='CVR' and string-length(.) != 8</pattern>:
   WARNING: CVR numbers are 8 digits in length
</error></xsl:if>
<xsl:if test="@schemeID='CVR' and . != (. + 1) - 1">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>@schemeID='CVR' and . != (. + 1) - 1</pattern>:
   WARNING: CVR numbers are 8 digits in length
</error></xsl:if>
<xsl:if test="@schemeID='SE' and string-length(.) != 8">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>@schemeID='SE' and string-length(.) != 8</pattern>:
   WARNING: SE numbers are 8 digits in length
</error></xsl:if>
<xsl:if test="@schemeID='SE' and . != (. + 1) - 1">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>@schemeID='SE' and . != (. + 1) - 1</pattern>:
   WARNING: SE numbers are 8 digits in length
</error></xsl:if>
<xsl:apply-templates mode="M13" />
</xsl:template>
<xsl:template match="text()" priority="-1" mode="M13" />
<!-- FC 20090923 issue 5
<xsl:template match="/*[local-name()='Invoice']/com:BuyersReferenceID[substring(.,13,1)!=0]" priority="4000" mode="M14">
<xsl:if test="((((10 - substring((substring(.,1,1) * 1 + substring(.,2,1) * 3) + (substring(.,3,1) * 1 + substring(.,4,1) * 3) + (substring(.,5,1) * 1 + substring(.,6,1) * 3) + (substring(.,7,1) * 1 + substring(.,8,1) * 3) + (substring(.,9,1) * 1 + substring(.,10,1) * 3) + (substring(.,11,1) * 1 + substring(.,12,1) * 3),string-length((substring(.,1,1) * 1 + substring(.,2,1) * 3) + (substring(.,3,1) * 1 + substring(.,4,1) * 3) + (substring(.,5,1) * 1 + substring(.,6,1) * 3) + (substring(.,7,1) * 1 + substring(.,8,1) * 3) + (substring(.,9,1) * 1 + substring(.,10,1) * 3) + (substring(.,11,1) * 1 + substring(.,12,1) * 3)),1)) + ((substring(.,1,1) * 1 + substring(.,2,1) * 3) + (substring(.,3,1) * 1 + substring(.,4,1) * 3) + (substring(.,5,1) * 1 + substring(.,6,1) * 3) + (substring(.,7,1) * 1 + substring(.,8,1) * 3) + (substring(.,9,1) * 1 + substring(.,10,1) * 3) + (substring(.,11,1) * 1 + substring(.,12,1) * 3))) - ((substring(.,1,1) * 1 + substring(.,2,1) * 3) + (substring(.,3,1) * 1 + substring(.,4,1) * 3) + (substring(.,5,1) * 1 + substring(.,6,1) * 3) + (substring(.,7,1) * 1 + substring(.,8,1) * 3) + (substring(.,9,1) * 1 + substring(.,10,1) * 3) + (substring(.,11,1) * 1 + substring(.,12,1) * 3))) != substring(.,13,1) )">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>((((10 - substring((substring(.,1,1) * 1 + substring(.,2,1) * 3) + (substring(.,3,1) * 1 + substring(.,4,1) * 3) + (substring(.,5,1) * 1 + substring(.,6,1) * 3) + (substring(.,7,1) * 1 + substring(.,8,1) * 3) + (substring(.,9,1) * 1 + substring(.,10,1) * 3) + (substring(.,11,1) * 1 + substring(.,12,1) * 3),string-length((substring(.,1,1) * 1 + substring(.,2,1) * 3) + (substring(.,3,1) * 1 + substring(.,4,1) * 3) + (substring(.,5,1) * 1 + substring(.,6,1) * 3) + (substring(.,7,1) * 1 + substring(.,8,1) * 3) + (substring(.,9,1) * 1 + substring(.,10,1) * 3) + (substring(.,11,1) * 1 + substring(.,12,1) * 3)),1)) + ((substring(.,1,1) * 1 + substring(.,2,1) * 3) + (substring(.,3,1) * 1 + substring(.,4,1) * 3) + (substring(.,5,1) * 1 + substring(.,6,1) * 3) + (substring(.,7,1) * 1 + substring(.,8,1) * 3) + (substring(.,9,1) * 1 + substring(.,10,1) * 3) + (substring(.,11,1) * 1 + substring(.,12,1) * 3))) - ((substring(.,1,1) * 1 + substring(.,2,1) * 3) + (substring(.,3,1) * 1 + substring(.,4,1) * 3) + (substring(.,5,1) * 1 + substring(.,6,1) * 3) + (substring(.,7,1) * 1 + substring(.,8,1) * 3) + (substring(.,9,1) * 1 + substring(.,10,1) * 3) + (substring(.,11,1) * 1 + substring(.,12,1) * 3))) != substring(.,13,1) )</pattern>:
   BuyersReferenceID is not formatted as a proper EAN number.
</error></xsl:if>
<xsl:choose>
<xsl:when test="@schemeID='EAN'" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>@schemeID='EAN'</pattern>:
   WARNING: It is a best practice to put an schemeID attribute on BuyersReferenceID with a value equalling EAN
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M14" />
</xsl:template>
<xsl:template match="/*/com:BuyersReferenceID[substring(.,13,1)=0]" priority="3999" mode="M14">
<xsl:if test="substring((substring(.,1,1) * 1 + substring(.,2,1) * 3) + (substring(.,3,1) * 1 + substring(.,4,1) * 3) + (substring(.,5,1) * 1 + substring(.,6,1) * 3) + (substring(.,7,1) * 1 + substring(.,8,1) * 3) + (substring(.,9,1) * 1 + substring(.,10,1) * 3) + (substring(.,11,1) * 1 + substring(.,12,1) * 3),string-length((substring(.,1,1) * 1 + substring(.,2,1) * 3) + (substring(.,3,1) * 1 + substring(.,4,1) * 3) + (substring(.,5,1) * 1 + substring(.,6,1) * 3) + (substring(.,7,1) * 1 + substring(.,8,1) * 3) + (substring(.,9,1) * 1 + substring(.,10,1) * 3) + (substring(.,11,1) * 1 + substring(.,12,1) * 3)),1) != 0">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>substring((substring(.,1,1) * 1 + substring(.,2,1) * 3) + (substring(.,3,1) * 1 + substring(.,4,1) * 3) + (substring(.,5,1) * 1 + substring(.,6,1) * 3) + (substring(.,7,1) * 1 + substring(.,8,1) * 3) + (substring(.,9,1) * 1 + substring(.,10,1) * 3) + (substring(.,11,1) * 1 + substring(.,12,1) * 3),string-length((substring(.,1,1) * 1 + substring(.,2,1) * 3) + (substring(.,3,1) * 1 + substring(.,4,1) * 3) + (substring(.,5,1) * 1 + substring(.,6,1) * 3) + (substring(.,7,1) * 1 + substring(.,8,1) * 3) + (substring(.,9,1) * 1 + substring(.,10,1) * 3) + (substring(.,11,1) * 1 + substring(.,12,1) * 3)),1) != 0</pattern>:
   BuyersReferenceID is not formatted as a proper EAN number.
</error></xsl:if>
<xsl:choose>
<xsl:when test="@schemeID='EAN'" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>@schemeID='EAN'</pattern>:
   WARNING: It is a best practice to put an schemeID attribute on BuyersReferenceID with a value equalling EAN
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M14" />
</xsl:template>
-->
<xsl:template match="text()" priority="-1" mode="M14" />
<xsl:template match="/pie:Invoice/com:PaymentMeans | /pcm:Invoice/com:PaymentMeans" priority="4000" mode="M15">
<xsl:choose>
<xsl:when test="com:PaymentChannelCode='INDBETALINGSKORT' or com:PaymentChannelCode='KONTOOVERFØRSEL' or com:PaymentChannelCode='NATIONAL CLEARING' or com:PaymentChannelCode='DIRECT DEBET'" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:PaymentChannelCode='INDBETALINGSKORT' or com:PaymentChannelCode='KONTOOVERFØRSEL' or com:PaymentChannelCode='NATIONAL CLEARING' or com:PaymentChannelCode='DIRECT DEBET'</pattern>:
   com:PaymentChannelCode should equal INDBETALINGSKORT or KONTOOVERFØRSEL or NATIONAL CLEARING or DIRECT DEBET
</error></xsl:otherwise>
</xsl:choose>
<xsl:if test="com:TypeCodeID=01 and com:PaymentID &gt; 0">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:TypeCodeID=01 and com:PaymentID &gt; 0</pattern>:
   IF com:TypeCodeID under PaymentMeans = 01 then com:PaymentID under PaymentMeans should not be found or should equal 0
</error></xsl:if>
<xsl:if test="com:TypeCodeID='null' and com:PaymentChannelCode='INDBETALINGSKORT'">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:TypeCodeID='null' and com:PaymentChannelCode='INDBETALINGSKORT'</pattern>:
   If PaymentChannelCode is "KONTOOVERFØRSEL" or "DIRECT DEBET" then com:TypeCodeID = "null"
</error></xsl:if>
<xsl:if test="(com:TypeCodeID=15 and string-length(com:PaymentID) != 16)">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>(com:TypeCodeID=15 and string-length(com:PaymentID) != 16)</pattern>:
   IF com:TypeCodeID under PaymentMeans = 15 then com:PaymentID under PaymentMeans should be a number of 16 digits in length
</error></xsl:if>
<xsl:if test="com:TypeCodeID=04 and string-length(com:PaymentID) != 16">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:TypeCodeID=04 and string-length(com:PaymentID) != 16</pattern>:
   IF com:TypeCodeID under PaymentMeans = 04 then com:PaymentID under PaymentMeans should be a number of 16 digits in length
</error></xsl:if>
<xsl:if test="com:TypeCodeID=75 and string-length(com:PaymentID) != 16">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:TypeCodeID=75 and string-length(com:PaymentID) != 16</pattern>:
   IF com:TypeCodeID under PaymentMeans = 75 then com:PaymentID under PaymentMeans should be a number of 16 digits in length
</error></xsl:if>
<xsl:if test="com:TypeCodeID=71 and string-length(com:PaymentID) != 15">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:TypeCodeID=71 and string-length(com:PaymentID) != 15</pattern>:
   IF com:TypeCodeID under PaymentMeans = 71 then com:PaymentID under PaymentMeans should be a number of 15 digits in length
</error></xsl:if>
<xsl:if test="com:TypeCodeID=73 and com:PaymentID &gt; 0">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:TypeCodeID=73 and com:PaymentID &gt; 0</pattern>:
   IF com:TypeCodeID under PaymentMeans = 73 then com:PaymentID under PaymentMeans should not be found or should equal 0
</error></xsl:if>
<!-- <xsl:if test="com:TypeCodeID=71 and com:PayeeFinancialAccount">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:TypeCodeID=71 and com:PayeeFinancialAccount</pattern>:
   When TypeCodeID under PaymentMeans = 71 then there should not be a com:PayeeFinancialAccount under PaymentMeans
</error></xsl:if> -->
<xsl:if test="com:TypeCodeID=73 and com:PayeeFinancialAccount">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:TypeCodeID=73 and com:PayeeFinancialAccount</pattern>:
   When TypeCodeID under PaymentMeans = 73 then there should not be a com:PayeeFinancialAccount under PaymentMeans
</error></xsl:if>
<xsl:if test="com:TypeCodeID=75 and com:PayeeFinancialAccount">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:TypeCodeID=75 and com:PayeeFinancialAccount</pattern>:
   When TypeCodeID under PaymentMeans = 75 then there should not be a com:PayeeFinancialAccount under PaymentMeans
</error></xsl:if>
<xsl:if test="com:TypeCodeID=04 and (not(com:PaymentDueDate) or not(com:PaymentChannelCode) or not(com:PayeeFinancialAccount))">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:TypeCodeID=04 and (not(com:PaymentDueDate) or not(com:PaymentChannelCode) or not(com:PayeeFinancialAccount))</pattern>:
   WARNING: When com:TypeCodeID under PaymentMeans = 04 then all classes and fields under PaymentMeans other than com:JointPaymentID and com:PaymentAdvice are considered to be required
</error></xsl:if>
<xsl:if test="com:TypeCodeID=15 and (not(com:PaymentDueDate) or not(com:PaymentChannelCode) or not(com:PayeeFinancialAccount))">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:TypeCodeID=15 and (not(com:PaymentDueDate) or not(com:PaymentChannelCode) or not(com:PayeeFinancialAccount))</pattern>:
   WARNING: When com:TypeCodeID under PaymentMeans = 15 then all classes and fields under PaymentMeans other than com:JointPaymentID and com:PaymentAdvice are considered to be required
</error></xsl:if>
<xsl:if test="com:TypeCodeID=75 and (not(com:PaymentDueDate) or not(com:PaymentChannelCode) or not(com:PaymentID) or not(com:JointPaymentID) or not(com:PaymentAdvice))">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:TypeCodeID=75 and (not(com:PaymentDueDate) or not(com:PaymentChannelCode) or not(com:PaymentID) or not(com:JointPaymentID) or not(com:PaymentAdvice))</pattern>:
   WARNING: When com:TypeCodeID under PaymentMeans = 75 then all classes and fields under PaymentMeans except com:PayeeFinancialAccount are considered to be required
</error></xsl:if>
<xsl:if test="com:TypeCodeID=73 and (not(com:PaymentDueDate) or not(com:PaymentChannelCode) or not(com:JointPaymentID) or not(com:PaymentAdvice))">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:TypeCodeID=73 and (not(com:PaymentDueDate) or not(com:PaymentChannelCode) or not(com:JointPaymentID) or not(com:PaymentAdvice))</pattern>:
   WARNING: When com:TypeCodeID under PaymentMeans = 73 then all classes and fields under PaymentMeans except com:PayeeFinancialAccount and com:PaymentID are considered to be required
</error></xsl:if>
<!-- <xsl:if test="com:TypeCodeID=71 and (not(com:PaymentDueDate) or not(com:PaymentChannelCode) or not(com:PaymentID) or not(com:JointPaymentID))">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:TypeCodeID=71 and (not(com:PaymentDueDate) or not(com:PaymentChannelCode) or not(com:PaymentID) or not(com:JointPaymentID))</pattern>:
   WARNING: When com:TypeCodeID under PaymentMeans = 71 then all fields under PaymentMeans but none of the classes are considered to be required
</error></xsl:if> -->
<xsl:apply-templates mode="M15" />
</xsl:template>
<xsl:template match="text()" priority="-1" mode="M15" />
<xsl:template match="com:PayeeFinancialAccount[/pie:Invoice or /pcm:Invoice]" priority="4000" mode="M16">
<xsl:choose>
<xsl:when test="com:TypeCode = 'null' or com:TypeCode = 'BANK' or com:TypeCode = 'GIRO' or com:TypeCode = 'KREDITORNR' or com:TypeCode = 'FIK' or com:TypeCode = 'BANKGIROT' or com:TypeCode = 'POSTGIROT' or com:TypeCode = 'IBAN'" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:TypeCode = 'null' or com:TypeCode = 'BANK' or com:TypeCode = 'GIRO' or com:TypeCode = 'KREDITORNR' or com:TypeCode = 'FIK' or com:TypeCode = 'BANKGIROT' or com:TypeCode = 'POSTGIROT' or com:TypeCode = 'IBAN'</pattern>:
   <xsl:text xml:space="preserve"> </xsl:text>
<xsl:value-of select="name(.)" /><xsl:text xml:space="preserve"> </xsl:text>should equal 'null' ,'BANK','GIRO','KREDITORNR','FIK','BANKGIROT','POSTGIROT', or 'IBAN'
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M16" />
</xsl:template>
<xsl:template match="text()" priority="-1" mode="M16" />
<xsl:template match="com:FinancialInstitution[/pie:Invoice or /pcm:Invoice]" priority="4000" mode="M17">
<xsl:choose>
<xsl:when test="com:ID = 'null' or string-length(com:ID) = 8  or string-length(com:ID) = 11" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:ID = 'null' or string-length(com:ID) = 8 or string-length(com:ID) = 11</pattern>:
   com:ID under FinancialInstitution should be null or 8 or 11 character alphanumeric string. 11 Character strings are sometimes used in other countries, hence their allowance here, but otherwise they should be avoided.
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M17" />
</xsl:template>
<xsl:template match="text()" priority="-1" mode="M17" />
<xsl:template match="com:PaymentTerms[/pie:Invoice or /pcm:Invoice]" priority="4000" mode="M18">
<xsl:choose>
<xsl:when test="com:ID = 'CONTRACT' or com:ID = 'SPECIFIC'" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:ID = 'CONTRACT' or com:ID = 'SPECIFIC'</pattern>:
   com:ID under PaymentTerms should equal CONTRACT or SPECIFIC
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M18" />
</xsl:template>
<xsl:template match="text()" priority="-1" mode="M18" />
<xsl:template match="com:AllowanceCharge[/pie:Invoice or /pcm:Invoice]" priority="4000" mode="M19">
<xsl:choose>
<xsl:when test="com:ID='Rabat' or com:ID='Gebyr' or com:ID='Fragt' or com:ID='Afgift' or com:ID='Told'" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:ID='Rabat' or com:ID='Gebyr' or com:ID='Fragt' or com:ID='Afgift' or com:ID='Told'</pattern>:
   <xsl:text xml:space="preserve"> </xsl:text>
<xsl:value-of select="name(.)" /><xsl:text xml:space="preserve"> </xsl:text>should equal 'Rabat','Gebyr','Fragt','Afgift', or 'Told'.
</error></xsl:otherwise>
</xsl:choose>
<xsl:if test="com:ChargeIndicator != 'true' and com:ChargeIndicator != 'false'">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:ChargeIndicator != 'true' and com:ChargeIndicator != 'false'</pattern>:
   ChargeIndicator under AllowanceCharge should equal either true or false
</error></xsl:if>
<xsl:choose>
<xsl:when test="count(com:AllowanceChargeAmount)&lt;2" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>count(com:AllowanceChargeAmount)&lt;2</pattern>:
   Only one one AllowanceCharge amount allowed per allowance charge.
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M19" />
</xsl:template>
<xsl:template match="text()" priority="-1" mode="M19" />
<xsl:template match="com:InvoiceLine/com:Item/com:CommodityClassification/com:CommodityCode[@listID='UNSPSC'][/pie:Invoice or /pcm:Invoice]" priority="4000" mode="M20">
<xsl:if test="string-length(.) != 10 and string-length(.) != 8">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(.) != 10 and string-length(.) != 8</pattern>:
   When the listID is UNSPSC the content of CommodityClassification should be following the UNSPSC recommendation with a 10 or 8 digit number
</error></xsl:if>
<xsl:if test=". != (. + 1) - 1">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>. != (. + 1) - 1</pattern>:
   When the listID is UNSPSC the content of CommodityClassification should be following the UNSPSC recommendation with a 10 or 8 digit number
</error></xsl:if>
<xsl:apply-templates mode="M20" />
</xsl:template>
<xsl:template match="text()" priority="-1" mode="M20" />
<xsl:template match="com:InvoiceLine/com:Item/com:Tax/com:TaxScheme/com:ID[/pie:Invoice or /pcm:Invoice]" priority="4000" mode="M21">
<xsl:choose>
<xsl:when test="string-length(substring-before(.,'-'))=4" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(substring-before(.,'-'))=4</pattern>:
   com:ID under com:Item/com:Tax/com:TaxScheme/com:ID is a 'MomsAngivelsesParagraf' in the form of '2004-3-P.1.2.1'
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="substring-before(.,'-') = (substring-before(.,'-') + 1) - 1 " />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>substring-before(.,'-') = (substring-before(.,'-') + 1) - 1</pattern>:
   com:ID under com:Item/com:Tax/com:TaxScheme/com:ID is a 'MomsAngivelsesParagraf' in the form of '2004-3-P.1.2.1'
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M21" />
</xsl:template>
<xsl:template match="com:Tax/com:TypeCode[/pie:Invoice or /pcm:Invoice]" priority="3999" mode="M21">
<xsl:choose>
<xsl:when test=".='VAT' or .='ZERO-RATED'" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>.='VAT' or .='ZERO-RATED'</pattern>:
   <xsl:text xml:space="preserve"> </xsl:text>
<xsl:value-of select="name(.)" /><xsl:text xml:space="preserve"> </xsl:text>should equal VAT or ZERO-RATED.
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M21" />
</xsl:template>
<xsl:template match="com:RateCategoryCodeID[/pie:Invoice or /pcm:Invoice]" priority="3998" mode="M21">
<xsl:choose>
<xsl:when test=".='VAT' or .='ZERO-RATED'" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>.='VAT' or .='ZERO-RATED'</pattern>:
   <xsl:text xml:space="preserve"> </xsl:text>
<xsl:value-of select="name(.)" /><xsl:text xml:space="preserve"> </xsl:text>should equal VAT or ZERO-RATED.
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M21" />
</xsl:template>
<xsl:template match="com:TaxTotal/com:TaxTypeCode[/pie:Invoice or /pcm:Invoice]" priority="3997" mode="M21">
<xsl:choose>
<xsl:when test=".='VAT' or .='ZERO-RATED'" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>.='VAT' or .='ZERO-RATED'</pattern>:
   <xsl:text xml:space="preserve"> </xsl:text>
<xsl:value-of select="name(.)" /><xsl:text xml:space="preserve"> </xsl:text>should equal VAT or ZERO-RATED.
</error></xsl:otherwise>
</xsl:choose>
<xsl:if test="following-sibling::com:TaxTypeCode[1][.=current()]">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>following-sibling::com:TaxTypeCode[1][.=current()]</pattern>:
   There should only be one VAT or ZERO-RATED<xsl:text xml:space="preserve"> </xsl:text>
<xsl:value-of select="name(.)" /><xsl:text xml:space="preserve"> </xsl:text>
</error></xsl:if>
<xsl:if test="preceding-sibling::com:TaxTypeCode[1][.=current()]">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>preceding-sibling::com:TaxTypeCode[1][.=current()]</pattern>:
   There should only be one VAT or ZERO-RATED<xsl:text xml:space="preserve"> </xsl:text>
<xsl:value-of select="name(.)" /><xsl:text xml:space="preserve"> </xsl:text>
</error></xsl:if>
<xsl:apply-templates mode="M21" />
</xsl:template>
<xsl:template match="text()" priority="-1" mode="M21" />
<xsl:template match="com:InvoiceLine/com:ReferencedOrderLine/com:DeliveryRequirement[/pie:Invoice or /pcm:Invoice]" priority="4000" mode="M22">
<xsl:choose>
<xsl:when test="com:ID='Deliverydate' or com:ID ='Period'" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:ID='Deliverydate' or com:ID ='Period'</pattern>:
   ReferencedOrderLine - DeliveryRequirement - ID should equal Deliverydate or Period.
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="count(com:DeliverySchedule)&lt;5" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>count(com:DeliverySchedule)&lt;5</pattern>:
   DeliveryScedule under com:InvoiceLine/com:ReferencedOrderLine/com:DeliveryRequirement should be less than 5
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M22" />
</xsl:template>
<xsl:template match="text()" priority="-1" mode="M22" />
<xsl:template match="com:InvoiceLine/com:ReferencedOrderLine/com:Item[/pie:Invoice or /pcm:Invoice]" priority="4000" mode="M23">
<xsl:choose>
<xsl:when test="count(com:Tax)&lt;2" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>count(com:Tax)&lt;2</pattern>:
   There should only be one Item - Tax per ReferencedOrderLine.
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M23" />
</xsl:template>
<xsl:template match="text()" priority="-1" mode="M23" />
<xsl:template match="com:DeliverySchedule[/pie:Invoice or /pcm:Invoice]" priority="4000" mode="M24">
<xsl:if test="com:ID &gt; 4">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:ID &gt; 4</pattern>:
   DeliverySchedule ID should be either 1,2,3, or 4
</error></xsl:if>
<xsl:if test="com:ID &lt; 1">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:ID &lt; 1</pattern>:
   DeliverySchedule ID should be either 1,2,3, or 4
</error></xsl:if>
<xsl:choose>
<xsl:when test="com:RequestedDeliveryDateTime" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>com:RequestedDeliveryDateTime</pattern>:
   RequestedDeliveryDateTime element is missing in the DeliverySchedule element
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M24" />
</xsl:template>
<xsl:template match="text()" priority="-1" mode="M24" />
<xsl:template match="com:MultiplierFactorQuantity[/pie:Invoice or /pcm:Invoice] | com:InvoicedQuantity[/pie:Invoice or /pcm:Invoice] | com:BaseQuantity[/pie:Invoice or /pcm:Invoice]" priority="4000" mode="M25">
<xsl:choose>
<xsl:when test="(translate(@unitCode,' ',' ') != ' ') and (string-length(@unitCode) &gt; 0)" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>(translate(@unitCode,' ',' ') != ' ') and (string-length(@unitCode) &gt; 0)</pattern>:
   the unitCode attribute must be filled out
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="@unitCodeListAgencyID='UN/UOM' or @unitCodeListAgencyID='n/a'" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>@unitCodeListAgencyID='UN/UOM' or @unitCodeListAgencyID='n/a'</pattern>:
   The unitCodeListAgencyID should = UN/UOM or n/a
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M25" />
</xsl:template>
<xsl:template match="text()" priority="-1" mode="M25" />
<xsl:template match="com:ToBePaidTotalAmount[/pie:Invoice or /pcm:Invoice]" priority="4000" mode="M26">
<xsl:choose>
<xsl:when test="not(starts-with(.,'-'))" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>not(starts-with(.,'-'))</pattern>:
   com:ToBePaidTotalAmount should be positive, if your document is a faktura with a negative amount represent the document as a kreditnota.
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M26" />
</xsl:template>
<xsl:template match="text()" priority="-1" mode="M26" />
<xsl:template match="com:PayeeNote[/pie:Invoice or /pcm:Invoice] | com:PayerNote[/pie:Invoice or /pcm:Invoice]" priority="4000" mode="M27">
<xsl:choose>
<xsl:when test="string-length(.)&lt;21" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(.)&lt;21</pattern>:
   <xsl:text xml:space="preserve"> </xsl:text>
<xsl:value-of select="name(.)" /><xsl:text xml:space="preserve"> </xsl:text>may not be longer than 20 characters
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M27" />
</xsl:template>
<xsl:template match="text()" priority="-1" mode="M27" />
<xsl:template match="com:InvoiceLine/com:Item[/pie:Invoice or /pcm:Invoice]" priority="4000" mode="M28">
<xsl:choose>
<xsl:when test="string-length(com:Description)&gt;0" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(com:Description)&gt;0</pattern>:
   Description under InvoiceLine Item should be greater than 0 in length
</error></xsl:otherwise>
</xsl:choose>
<xsl:choose>
<xsl:when test="string-length(com:ID)&gt;0" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(com:ID)&gt;0</pattern>:
   WARNING: ID under InvoiceLine Item should be greater than 0 in length
</error></xsl:otherwise>
</xsl:choose>
<xsl:if test="count(com:Tax)&gt;1">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>count(com:Tax)&gt;1</pattern>:
   There should only be one Tax element under item.
</error></xsl:if>
<xsl:apply-templates mode="M28" />
</xsl:template>
<xsl:template match="text()" priority="-1" mode="M28" />
<xsl:template match="com:PenaltySurchargeRateNumeric[/pie:Invoice or /pcm:Invoice] | com:SettlementDiscountRateNumeric[/pie:Invoice or /pcm:Invoice]" priority="4000" mode="M29">
<xsl:if test="(number(.)&lt;0) or (number(.)&gt;1000)">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>(number(.)&lt;0) or (number(.)&gt;1000)</pattern>:
   <xsl:text xml:space="preserve"> </xsl:text>
<xsl:value-of select="name(.)" /><xsl:text xml:space="preserve"> </xsl:text>should be a value of 0 to 1000. 0 is considered in this context to include multiple zeros, 00 is still 0.
</error></xsl:if>
<xsl:apply-templates mode="M29" />
</xsl:template>
<xsl:template match="text()" priority="-1" mode="M29" />
<xsl:template match="com:LongAdvice[/pie:Invoice or /pcm:Invoice]" priority="4000" mode="M30">
<xsl:if test="string-length(.)&gt;1475">
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>string-length(.)&gt;1475</pattern>:
   Long Advice should not be more than 40 lines, 35 characters per line - 1475 characters in all.
</error></xsl:if>
<xsl:apply-templates mode="M30" />
</xsl:template>
<xsl:template match="text()" priority="-1" mode="M30" />
<xsl:template match="com:RatePercentNumeric[/pie:Invoice or /pcm:Invoice]" priority="4000" mode="M31">
<xsl:choose>
<xsl:when test="(number(.) = '0') or (.='25')" />
<xsl:otherwise>
<error><xsl:attribute name="context"><xsl:value-of select="concat(name(parent::*),'/',name())" /></xsl:attribute>
<pattern>(number(.) = '0') or (.='25')</pattern>:
   RatePercentNumeric should equal 0 or 25. 0 is considered in this context to include multiple zeros, 00 is still 0.
</error></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates mode="M31" />
</xsl:template>
<xsl:template match="text()" priority="-1" mode="M31" />
<xsl:template match="text()" priority="-1" />
</xsl:stylesheet>
