<!--
     This is a TEST version for the country-specific rules for NL
     Do NOT use these in production.
     
     This particular file is a snippet that can be included in a full document
     type schematron file.
     
     All rules are fatal, and will result in validation failures.
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="false" id="nlcius">
  <!-- These rules only apply when the supplier is in the Netherlands -->
  <!-- $supplierCountry is defined by Peppol schematron files -->
  <let name="nl" value="$supplierCountry = 'NL'" />
  <rule context="cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[$nl]">
    <!-- Original rule in NLCIUS: BR-NL-1 -->
    <assert id="NL-R-001" test="(contains(concat(' ', string-join(@schemeID, ' '), ' '), ' 0106 ') or contains(concat(' ', string-join(@schemeID, ' '), ' '), ' 0190 ')) and (normalize-space(.) != '')" flag="warning">[NL-R-001] For suppliers in the Netherlands, the legal entity identifier MUST be either a KVK or OIN number for its legal entity identifier (schemeID 0106 or 0190)</assert>
  </rule>
  <rule context="cac:AccountingSupplierParty/cac:Party/cac:PostalAddress[$nl]">
    <!-- Original rule in NLCIUS: BR-NL-3 -->
    <assert id="NL-R-002" test="cbc:StreetName and
                    cbc:CityName and
                    cbc:PostalZone" flag="warning">[NL-R-002] For suppliers in the Netherlands the supplier's address (cac:AccountingSupplierParty/cac:Party/cac:PostalAddress) MUST contain street name (cbc:StreetName), city (cbc:CityName) and postal zone (cbc:PostalZone)</assert>
  </rule>
  <rule context="cac:AccountingCustomerParty/cac:Party/cac:PostalAddress[$nl]">
    <!-- Original rule in NLCIUS: BR-NL-4 -->
    <assert id="NL-R-003" test="cac:Country/cbc:IdentificationCode != 'NL' or (
                    cbc:StreetName and
                    cbc:CityName and
                    cbc:PostalZone)" flag="warning">[NL-R-003] For suppliers in the Netherlands, if the customer is in the Netherlands, the customer address (cac:AccountingCustomerParty/cac:Party/cac:PostalAddress) MUST contain the street name (cbc:StreetName), the city (cbc:CityName) and the postal zone (cbc:PostalZone)</assert>
  </rule>
  <rule context="cac:TaxRepresentativeParty/cac:PostalAddress[$nl]">
    <!-- Original rule in NLCIUS: BR-NL-5 -->
    <assert id="NL-R-004" test="(cac:Country/cbc:IdentificationCode != 'NL') or
                    (cbc:StreetName and
                     cbc:CityName and
                     cbc:PostalZone)" flag="warning">[NL-R-004] For suppliers in the Netherlands, if the fiscal representative is in the Netherlands, the representative's address (cac:TaxRepresentativeParty/cac:PostalAddress) MUST contain street name (cbc:StreetName), city (cbc:CityName) and postal zone (cbc:PostalZone)</assert>
  </rule>
  <rule context="cbc:InvoiceTypeCode[$nl]|cbc:CreditNoteTypeCode[$nl]">
    <!-- Original rule in NLCIUS: BR-NL-9 -->
    <assert id="NL-R-005" test="(. != '384') or
                    /*/cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID" flag="warning">[BR-NL-9] For suppliers in the Netherlands, if the document is a corrective invoice (cbc:InvoiceTypeCode = 384), the document MUST contain an invoice reference (cac:BillingReference/cac:InvoiceDocumentReference/cbc:ID)</assert>
  </rule>
  <rule context="cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID[$nl]">
    <!-- Original rule in NLCIUS: BR-NL-10 -->
    <assert id="NL-R-006" test="
        (not(//cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode = 'NL')
         or (
         contains(concat(' ', string-join(./@schemeID, ' '), ' '), ' 0106 ')
         or
         contains(concat(' ', string-join(./@schemeID, ' '), ' '), ' 0190 ')
        ) and (normalize-space(.) != ''))
    " flag="warning">[NL-R-006] For suppliers in the Netherlands, if the customer is in the Netherlands, the customer's legal entity identifier MUST be either a KVK or OIN number (schemeID 0106 or 0190)</assert>
  </rule>
  <rule context="cac:LegalMonetaryTotal[$nl]">
    <!-- Original rule in NLCIUS: BR-NL-11 -->
    <assert id="NL-R-007" test="xs:decimal(cbc:PayableAmount) &lt;= 0.0 or (//cac:PaymentMeans)" flag="warning">[NL-R-007] For suppliers in the Netherlands, the supplier MUST provide a means of payment (cac:PaymentMeans) if the payment is from customer to supplier</assert>
  </rule>
  <rule context="cac:PaymentMeans[$nl]">
    <!-- Original rule in NLCIUS: BR-NL-12 -->
    <assert id="NL-R-008" test="normalize-space(cbc:PaymentMeansCode) = '30' or
              normalize-space(cbc:PaymentMeansCode) = '48' or
              normalize-space(cbc:PaymentMeansCode) = '49' or
              normalize-space(cbc:PaymentMeansCode) = '57' or
              normalize-space(cbc:PaymentMeansCode) = '58' or
              normalize-space(cbc:PaymentMeansCode) = '59'" flag="warning">[NL-R-008] For suppliers in the Netherlands, the payment means code (cac:PaymentMeans/cbc:PaymentMeansCode) MUST be one of 30, 48, 49, 57, 58 or 59</assert>
  </rule>
  <rule context="cac:OrderLineReference/cbc:LineID[$nl]">
    <assert id="BR-NL-13" test="exists(/*/cac:OrderReference/cbc:ID)" flag="warning">[BR-NL-13] For suppliers in the Netherlands, if an order line reference (BT-132) is used, there must be an order reference on the document level (BT-13)</assert>
  </rule>
</pattern>