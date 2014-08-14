<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
	xmlns:skos="http://www.w3.org/2004/02/skos/core#"
	xmlns:foaf="http://xmlns.com/foaf/0.1/"
	xmlns:dcterms="http://purl.org/dc/terms/"
	xmlns:nie="http://www.semanticdesktop.org/ontologies/2007/01/19/nie#"
	xmlns:nfo="http://www.semanticdesktop.org/ontologies/2007/03/22/nfo#"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:dita="http://purl.org/dita/ns#"
	xmlns:schema="http://schema.org/"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:colin="http://colin.maudry.com/"
	xmlns:doc="http://www.oxygenxml.com/ns/doc/xsl"
	xmlns:ot="http://www.idiominc.com/opentopic"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema#">
	

	<doc:doc>
		<doc:desc>Passthrough template for topics</doc:desc>
	</doc:doc>
	<xsl:template match="
		*[contains(@class, ' topic/prolog ')] |
		*[contains(@class, ' topic/metadata ')]
		">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="*[contains(@class, ' topic/body ')]  |
		*[contains(@class, ' topic/related-links ')]">
		<!-- In topic/body and topic/related-links, we only need the non-empty @href and @keyref elements -->
		<xsl:apply-templates select="descendant::*[@href!='' or @keyref!='']"/>
	</xsl:template>
	
</xsl:stylesheet>
