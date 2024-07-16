<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:html="http://www.w3.org/1999/xhtml" version="1.0">
    <xsl:output method="html" media-type="text/html" encoding="UTF-8" indent="no" version="4.0"/>
    <xsl:preserve-space elements="*"/>
    <xsl:param name="sequences" select="//*/@seq"/>
    <xsl:param name="css-path" select="''"/>
    <xsl:variable name="next" select="//tei:linkGrp/tei:link/@next"/>
    <xsl:variable name="prev" select="//tei:linkGrp/tei:link/@prev"/>
    <xsl:variable name="current" select="//tei:linkGrp/tei:link/@n"/>
    <xsl:variable name="firstname" select="substring-before(//tei:titleStmt/tei:author, ' ')"/>
    <xsl:variable name="lastname" select="substring-after(//tei:titleStmt/tei:author, ' ')"/>
    <xsl:variable name="fullname" select="//tei:publicationStmt/tei:p[@corresp = 'name']"/>
    <xsl:template match="tei:TEI">
        <html xmlns="http://www.w3.org/1999/xhtml" lang="nl" xml:lang="en">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <meta charset="UTF-8"/>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous"/>
                <xsl:element name="link">
                    <xsl:attribute name="rel">stylesheet</xsl:attribute>
                    <xsl:attribute name="type">text/css</xsl:attribute>
                    <xsl:attribute name="href">$app/data/projects/<xsl:value-of select="$css-path"/>/css/custom_style.css</xsl:attribute>
                </xsl:element>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"/>
                <!--<link rel="stylesheet" type="text/css" href="$track-changes-images/Van_Pelt/css/custom_style.css"/>-->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
                <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
                <link href="https://fonts.googleapis.com/css?family=Roboto Slab" rel="stylesheet"/>
                <title><xsl:value-of select="//tei:publicationStmt/tei:p[@corresp = 'section']"/> -
                    <xsl:value-of select="//tei:titleStmt/tei:author"/></title>
                <script type="application/javascript">
                    var a = 0; 
                    var count = 0;
                </script>
            </head>
            <body>
                <nav class="navbar navbar-expand-lg navbar-light">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="#"><xsl:value-of select="//tei:titleStmt/tei:author"/> | <xsl:value-of select="//tei:publicationStmt/tei:p[@corresp = 'section']"/></a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"/>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item">
                                    <a class="nav-link " aria-current="page" href="../../index.html">Track Changes</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Schrijfsessies </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <xsl:apply-templates select="//tei:sourceDesc/tei:p/tei:material"/>
                                        
                                    </ul>
                                </li>
                                <!--<li class="nav-item">
                                    <a class="nav-link " aria-current="page" href="#">Over
                                        <xsl:value-of select="//tei:titleStmt/tei:author"/></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" aria-current="page" href="#"><xsl:value-of select="substring-after(//tei:titleStmt/tei:author, ' ')"/>'s schrijfproces</a>
                                </li>-->
                            </ul>
                        </div>
                    </div>
                    <span class="copyright" style="font-size:11px; opacity: 0.5;"><xsl:value-of select="//tei:publicationStmt/tei:p[@corresp = 'section']"/> © <xsl:value-of select="//tei:titleStmt/tei:author"/></span>
                </nav>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-1 d-none d-lg-block sides"/>
                        <div class="col-lg-4 col-md-4">
                            <div id="Begin" class="col-lg-4 d-none d-lg-block sidebar"><a href="javascript:void(0)" class="closebtn" onclick="closeBegin()">×</a><xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute><xsl:attribute name="alt">Word document
                                start of session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_b-1.jpeg</xsl:attribute></xsl:element><br/><xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute>
                                <xsl:attribute name="alt">Word document start of
                                session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_b-2.jpeg</xsl:attribute></xsl:element><br/>  <xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute>
                                <xsl:attribute name="alt">Word document start of
                                session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_b-3.jpeg</xsl:attribute></xsl:element><br/><xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute>
                                <xsl:attribute name="alt">Word document start of
                                session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_b-4.jpeg</xsl:attribute></xsl:element><br/><xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute>
                                <xsl:attribute name="alt">Word document start of
                                session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_b-5.jpeg</xsl:attribute></xsl:element><br/><xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute>
                                <xsl:attribute name="alt">Word document start of
                                session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                    <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_b-6.jpeg</xsl:attribute></xsl:element>
                                <br/>
                                <xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute>
                                        <xsl:attribute name="alt">Word document start of
                                            session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                        <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_b-7.jpeg</xsl:attribute></xsl:element>
                                <br/>
                                <xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute>
                                            <xsl:attribute name="alt">Word document start of
                                                session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                            <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_b-8.jpeg</xsl:attribute></xsl:element>
                                <br/>
                                <xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute>
                                                <xsl:attribute name="alt">Word document start of
                                                    session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                                <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_b-9.jpeg</xsl:attribute></xsl:element>
                                <br/>
                                <xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute>
                                                    <xsl:attribute name="alt">Word document start of
                                                        session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                                    <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_b-10.jpeg</xsl:attribute></xsl:element>
                                <br/>
                                <xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute>
                                                        <xsl:attribute name="alt">Word document start of
                                                            session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                                        <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_b-11.jpeg</xsl:attribute></xsl:element>
                                <br/>
                                <xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute>
                                                            <xsl:attribute name="alt">Word document start of
                                                                session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                                            <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_b-12.jpeg</xsl:attribute></xsl:element>
                                <br/>
                                <xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute>
                                    <xsl:attribute name="alt">Word document start of
                                        session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                    <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_b-13.jpeg</xsl:attribute></xsl:element></div>
                            <div id="End" class="col-lg-4 d-none d-lg-block sidebar"><a href="javascript:void(0)" class="closebtn" onclick="closeEnd()">×</a><xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute><xsl:attribute name="alt">Word document
                                start of session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_e-1.jpeg</xsl:attribute></xsl:element><br/>  <xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute>
                                <xsl:attribute name="alt">Word document start of
                                session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_e-2.jpeg</xsl:attribute></xsl:element><br/>  <xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute>
                                <xsl:attribute name="alt">Word document start of
                                session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_e-3.jpeg</xsl:attribute></xsl:element><br/>  <xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute>
                                <xsl:attribute name="alt">Word document start of
                                session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_e-4.jpeg</xsl:attribute></xsl:element><br/>  <xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute>
                                <xsl:attribute name="alt">Word document start of
                                session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_e-5.jpeg</xsl:attribute></xsl:element><br/>  <xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute>
                                <xsl:attribute name="alt">Word document start of
                                session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_e-6.jpeg</xsl:attribute></xsl:element>
                                <br/>  <xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute>
                                    <xsl:attribute name="alt">Word document start of
                                        session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                    <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_e-7.jpeg</xsl:attribute></xsl:element>
                                <br/>  <xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute>
                                    <xsl:attribute name="alt">Word document start of
                                        session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                    <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_e-8.jpeg</xsl:attribute></xsl:element>
                                <br/>  <xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute>
                                    <xsl:attribute name="alt">Word document start of
                                        session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                    <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_e-9.jpeg</xsl:attribute></xsl:element>
                                <br/>  <xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute>
                                    <xsl:attribute name="alt">Word document start of
                                        session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                    <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_e-10.jpeg</xsl:attribute></xsl:element>
                                <br/>  <xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute>
                                    <xsl:attribute name="alt">Word document start of
                                        session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                    <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_e-11.jpeg</xsl:attribute></xsl:element>
                                <br/>  <xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute>
                                    <xsl:attribute name="alt">Word document start of
                                        session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                    <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_e-12.jpeg</xsl:attribute></xsl:element>
                                <br/>  <xsl:element name="img"><xsl:attribute name="class">img-fluid</xsl:attribute>
                                    <xsl:attribute name="alt">Word document start of
                                        session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                    <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_e-13.jpeg</xsl:attribute></xsl:element></div>
                            <div><button style=";font-variant: small-caps;" class="openbtn" onclick="openBegin()"><i style="font-size:18px" class="fa"></i>
                                start word document</button> <button style="font-variant: small-caps;" class="openbtn" onclick="openEnd()"><i style="font-size:18px;" class="fa"></i> eind
                                word document</button></div>
                            <!--  <a id="show_image"  onclick="showhideimage()">Show Image</a>
                            
                            <xsl:element name="img"><xsl:attribute name="class">my_images</xsl:attribute>
                                <xsl:attribute name="alt">Word document start of
                                    session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_e-1.jpeg</xsl:attribute></xsl:element>
                            <xsl:element name="img"><xsl:attribute name="class">my_images</xsl:attribute><xsl:attribute name="style">display:none;</xsl:attribute>
                                <xsl:attribute name="alt">Word document start of
                                    session</xsl:attribute><xsl:attribute name="onerror">this.onerror=null;this.src='$track-changes-images/<xsl:value-of select="$css-path"/>/blank_page.jpeg';</xsl:attribute>
                                <xsl:attribute name="src">$track-changes-images/<xsl:value-of select="$css-path"/>/<xsl:value-of select="$current"/>_e-1.jpeg</xsl:attribute></xsl:element>-->
                            <div class="description">
                                <h2 align="left">
                                    <xsl:value-of select="//tei:titleStmt/tei:author"/>
                                    <xsl:text> - </xsl:text>
                                    <xsl:text>"</xsl:text>
                                    <xsl:value-of select="//tei:publicationStmt/tei:p[@corresp = 'section']"/>
                                    <xsl:text>"</xsl:text>
                                </h2>
                                <h3 align="left">
                                    <xsl:text>Sessie </xsl:text>
                                    <xsl:value-of select="//tei:publicationStmt/tei:p[@corresp = 'session']"/>
                                </h3>
                                <ul class="list-unstyled">
                                    <xsl:apply-templates select="//tei:head"/>
                                    <ul class="list-unstyled">
                                        <li>
                                            <xsl:text>Datum: </xsl:text>
                                            <xsl:value-of select="substring-after(//tei:sourceDesc/tei:p/tei:l[1], ':')"/>
                                        </li>
                                        <li>
                                            <xsl:text>Start tijd van de schrijfsessie: </xsl:text>
                                            <xsl:value-of select="substring-after(//tei:sourceDesc/tei:p/tei:l[2], ':')"/>
                                        </li>
                                        <li>
                                            <xsl:text>Duur van de schrijfsessie: </xsl:text>
                                            <xsl:value-of select="substring-after(//tei:sourceDesc/tei:p/tei:l[3], ':')"/>
                                        </li>
                                        <li>
                                            <xsl:text>Vordering: </xsl:text>
                                            <xsl:text>sessie-versie </xsl:text>
                                            <xsl:value-of select="//tei:publicationStmt/tei:p[@corresp = 'version']"/>
                                            <xsl:text>/</xsl:text>
                                            <xsl:value-of select="//tei:publicationStmt/tei:p[@corresp = 'total_versions']"/>
                                        </li>
                                        <li>
                                            <xsl:apply-templates select="//tei:sourceDesc/tei:p/tei:l[4]"/>
                                        </li>
                                    </ul>
                                </ul>
                                <h4>Over de schrijfsessie:</h4>
                                <p>
                                    <xsl:apply-templates select="//tei:sourceDesc/tei:p[@n = 'description']"/>
                                </p>
                                <ul>
                                    <li>
                                        <xsl:text>Totaal aantal veranderingen: </xsl:text>
                                        <xsl:value-of select="count(//tei:mod[@type = 'continue'] | //tei:add[@type = 'context'] | //tei:add[@type = 'nt'] | //tei:add[@type = 'pre-context'] | //tei:add[@type = 'typo'] | //tei:add[@type = 'translocation'] | //tei:del[@type = 'context'] | //tei:del[@type = 'typo'] | //tei:del[@type = 'pre-context'] | //tei:del[@type = 'translocation'])"/>
                                    </li>
                                    <li>
                                        <xsl:text>Aantal contextuele revisies: </xsl:text>
                                        <xsl:value-of select="count(//tei:add[@type = 'context'] | //tei:del[@type = 'context'])"/>
                                        <xsl:text>, met </xsl:text>
                                        <xsl:value-of select="count(//tei:add[@type = 'context'])"/>
                                        <xsl:text> toevoegingen,</xsl:text>
                                        <xsl:text> en </xsl:text>
                                        <xsl:value-of select="count(//tei:del[@type = 'context'])"/>
                                        <xsl:text> verwijderingen. </xsl:text>
                                    </li>
                                    <li>
                                        <xsl:text>Aantal pre-contextuele revisies: </xsl:text>
                                        <xsl:value-of select="count(//tei:add[@type = 'pre-context'] | //tei:del[@type = 'pre-context'])"/>
                                        <xsl:text>, met </xsl:text>
                                        <xsl:value-of select="count(//tei:add[@type = 'pre-context'])"/>
                                        <xsl:text> toevoegingen,</xsl:text>
                                        <xsl:text> en </xsl:text>
                                        <xsl:value-of select="count(//tei:del[@type = 'pre-context'])"/>
                                        <xsl:text> verwijderingen. </xsl:text>
                                    </li>
                                    <li>
                                        <xsl:text>Nieuw toegevoegde zinnen: </xsl:text>
                                        <xsl:value-of select="count(//tei:add[@type = 'nt']/tei:seg | //tei:seg/tei:add[@type = 'nt'] | //tei:seg/tei:del/tei:add[@type = 'nt'])"/>
                                    </li>
                                    <li>
                                        <xsl:text>Aantal verplaatsingen: </xsl:text>
                                        <xsl:value-of select="count(//tei:add[@type = 'translocation'])"/>
                                    </li>
                                    <li>
                                        <xsl:text>Aantal keren afmaken van onafgemaakte zinnen: </xsl:text>
                                        <xsl:value-of select="count(//tei:mod[@type = 'continue'])"/>
                                    </li>
                                    <li>
                                        <xsl:text>Aantal typefouten: </xsl:text>
                                        <xsl:value-of select="count(//tei:add[@type = 'typo'] | //tei:del[@type = 'typo'])"/>
                                        <xsl:text>, met </xsl:text>
                                        <xsl:value-of select="count(//tei:add[@type = 'typo'])"/>
                                        <xsl:text> toevoegingen,</xsl:text>
                                        <xsl:text> en </xsl:text>
                                        <xsl:value-of select="count(//tei:del[@type = 'typo'])"/>
                                        <xsl:text> verwijderingen. </xsl:text>
                                    </li>
                                </ul>
                                <p>
                                    <button class="btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseLegend" aria-expanded="false" aria-controls="collapseLegend" style="color:black">Soorten tekstuele aanpassingen</button>
                                </p>
                                <div class="collapse" id="collapseLegend">
                                    <div class="card card-body">
                                        <ul class="list-unstyled">
                                            <li style="color: #843371">Nieuwe zinnen. <i class="symbol">★</i></li>
                                            <li style="color: #8B95C9"><ins>Veranderde, opnieuw toegevoegde zinnen</ins>. </li>
                                            <li style="color: #04724D"><ins>Contextuele toevoegingen</ins>. <i class="symbol">►</i></li>
                                            <li style="color: #7FB069;"><ins>Pre-contextuele toevoegingen</ins>. <i class="symbol">◀</i></li>
                                            <li style="color: #B20D30"><s>Contextuele verwijderingen</s>.
                                                <i class="symbol">▷</i></li>
                                            <li style="color: #F35376"><s>Pre-contextuele verwijderingen</s>. <i class="symbol">◁</i></li>
                                            <li style="color: #875531"><s>Typefout (verwijdering)</s>. <i class="symbol">△</i></li>
                                            <li style="color: #BE7C4D">Typefout (toevoeging). <i class="symbol">▲</i></li>
                                            <li style="color: #377495"><s>Verplaatste tekst (verwijdering)</s>. <i class="symbol">✧</i></li>
                                            <li style="color: #377495"><ins>Verplaatste tekst (toevoeging)</ins>. <i class="symbol">✦</i></li>
                                            <li style="color: #ff9900">Afmaken van onafgemaakte zin. <i class="symbol">☆</i></li>
                                        </ul>
                                    </div>
                                </div>
                                <p>
                                    <button class="btn fa fa-info-circle" type="button" data-bs-toggle="collapse" data-bs-target="#collapseInfo" aria-expanded="false" aria-controls="collapseInfo" style="color:black">
                                    </button>
                                    <!--<button class="button" onclick="showhidenotes()"><div class="checkNotes">Notities</div></button>-->
                                </p>
                                <div class="collapse" id="collapseInfo">
                                    <div class="card card-body">
                                        <p>De 'default' tekst is de tekst aan het begin van de schrijfsessie. Om alle schrijfstappen te volgen in de volgorde waarin ze plaatsvonden (om de visualisatie 'af te spelen'), klik <i style="font-size:14px;" class="fa"></i>, of klik er in eigen tempo doorheen door telkens op <i style="font-size:14px;cursor: pointer;" class="fa"></i> te klikken. Gebruik <i style="font-size:14px;cursor: pointer;" class="fa"></i> om een 'schrijfstap' terug te zetten. Toon alle aanpassingen in een keer door op 'Alle wijzigingen' te klikken. Hierna kunnen de verwijderingen, toevoegingen, en/of typefouten al dan niet worden getoond door op 'Verwijderingen', 'Toevoegingen', en 'Typefouten' te klikken. 'Symbolen' plaatst alle aanpassingen tussen symbolen. 'Nummers' toont de chronologie-nummers van alle wijzigingen in de tekst. De nummer kunnen worden vergroot door op '<i style="font-size:12px" class="fa"></i> numbers' te klikken. 'Schrijfpad' toont het 'pad' dat de schrijver nam door de tekst en toont hoe lineair de schrijfsessie was.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-5 col-md-7 word">
                            
                            <xsl:apply-templates select="//tei:body/tei:p"/>
                        </div>
                        <div class="col-lg-1 col-md-1">
                            <div class="sticky-top">
                                <div style="text-align: center;">
                                    <i style="font-size:40px;margin-top: 10px;" class="fa"></i>
                                </div>
                                <p>
                                    <i style="font-size:24px;cursor: pointer;" class="fa start_btn"></i>
                                    <i onclick="stop()" style="font-size:24px;cursor: pointer;float: right;" class="fa stop_btn"></i>
                                </p>
                                <p>
                                    <i style="font-size:24px;cursor: pointer;" class="fa" id="countButton"></i>
                                    <i style="font-size:24px;cursor: pointer;float: right;" class="fa increase_btn"></i>
                                </p>
                                <div style="text-align: center;">
                                    <i style="font-size:24px;cursor: pointer" class="material-icons refresh_btn"></i>
                                </div>
                                <p id="demo" style="text-align: center;"/>
                            </div>
                        </div>
                        <div class="col-lg-1 d-none d-lg-block sides"/>
                    </div>
                    <div class="container-fluid fixed-bottom">
                        <div class="row">
                            <div class="col-lg-1 d-none d-lg-block sides"/>
                            <div class="col-lg-10 col-md-12 options" style="padding-bottom:15px;"><a href="{$prev}" title="Vorige schrijfsessie" style="font-size:24px;cursor: pointer;float: left; padding-top: 5px;" class="fa prev-session"></a>   Stap <i style="font-size:20px;font-style: normal;">①</i><button class="button" onclick="showhiderevisions()">Alle wijzigingen<i id="checkrevisions" class="hide">✓</i></button> Stap <i style="font-size:20px;font-style: normal;">②</i><button class="button" onclick="showhidedeletions()">Verwijderingen<i id="checkdel" class="hide">✓</i></button><button class="button" onclick="showhideadditions()">Toevoegingen<i id="checkadd" class="hide">✓</i></button><button class="button" onclick="showhidetypo()">Typefouten<i id="checktypo" class="hide">✓</i></button><button class="button" onclick="symbols()">Symbolen<i id="checksymbol" class="hide">✓</i></button><button class="button" onclick="numbers()">Nummers<i id="checknumbers" class="hide">✓</i></button><button class="button" onclick="BIGnumbers()"><i style="font-size:16px" class="fa"></i> Nummers<i id="checkmark" class="hide">✓</i></button><button class="button" onclick="createLine()">Schrijfpad<i id="checkpath" class="hide">✓</i></button>   <a href="{$next}" title="Volgende schrijfsessie" style="font-size:24px;cursor: pointer;float: right;padding-top: 5px;" class="fa next-session"></a></div>
                            <div class="col-lg-1 d-none d-lg-block sides"/>
                        </div>
                    </div>
                </div>
                <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"/>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"/>

                <script type="application/javascript">var rev = $(".add, .del, .cont, .chap").length;</script>
                <script src="$app/resources/js/script.js"/>
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template match="//tei:teiHeader"/>
    
    <xsl:template match="//tei:sourceDesc">
        <p class="description">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    <xsl:template match="//tei:head">
        <h1><xsl:apply-templates/></h1>
    </xsl:template>
    
    
    
    <xsl:template match="//tei:p"><p xmlns="http://www.w3.org/1999/xhtml"><xsl:apply-templates/></p></xsl:template>
    
    
    
    <xsl:template match="//tei:lb">
        <br xmlns="http://www.w3.org/1999/xhtml" style="display:none"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//tei:lb[@type = 'indent']">
        <br xmlns="http://www.w3.org/1999/xhtml" style="display:none"/><span xmlns="http://www.w3.org/1999/xhtml" class="indent"/><xsl:apply-templates/>
    </xsl:template>
    
    
    <xsl:template match="//tei:lb[@type = 'whiteline']">
        <br xmlns="http://www.w3.org/1999/xhtml"/><xsl:apply-templates/><span xmlns="http://www.w3.org/1999/xhtml" class="whiteline"/>
    </xsl:template>
    
    
    
    <xsl:template match="//tei:emph[@rend = 'italics']"><i xmlns="http://www.w3.org/1999/xhtml"><xsl:apply-templates/></i></xsl:template>
    
    <xsl:template match="//tei:emph[@rend = 'bold']"><b xmlns="http://www.w3.org/1999/xhtml"><xsl:apply-templates/></b></xsl:template>
    <xsl:template match="//tei:title"><xsl:apply-templates/></xsl:template>
    
    
    <xsl:template match="//tei:distinct[@rend = 'small-text']"><p xmlns="http://www.w3.org/1999/xhtml" style="font-size: 83%;"><xsl:apply-templates/></p></xsl:template>
    
    <xsl:template match="//tei:metamark"><div xmlns="http://www.w3.org/1999/xhtml" class="notes"><xsl:apply-templates/></div></xsl:template>
    
    <xsl:template match="//tei:add[@type = 'nt']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><span xmlns="http://www.w3.org/1999/xhtml" class="add nt"><xsl:attribute name="id">
                <xsl:value-of select="@n"/>
            </xsl:attribute><i class="symbol">★</i><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span><xsl:apply-templates/><i class="symbol">★</i></span></xsl:template>

    
    <xsl:template match="//tei:add[@type = 'nt|continue']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><span xmlns="http://www.w3.org/1999/xhtml" class="add nt"><xsl:attribute name="id">
                <xsl:value-of select="@n"/></xsl:attribute><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span><xsl:apply-templates/><i class="symbol">★</i></span></xsl:template>
    
    
    <xsl:template match="//tei:add[@type = 'rt']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><ins xmlns="http://www.w3.org/1999/xhtml" class="add rt"><xsl:attribute name="id">
            <xsl:value-of select="@n"/></xsl:attribute><xsl:apply-templates/><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span></ins></xsl:template>
    
    
    <xsl:template match="//tei:add[@type = 'rt|continue']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><ins xmlns="http://www.w3.org/1999/xhtml" class="add rt"><xsl:attribute name="id"><xsl:value-of select="@n"/></xsl:attribute><xsl:apply-templates/><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span></ins></xsl:template>
    
    
    
    <xsl:template match="//tei:mod[@type = 'continue']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><q xmlns="http://www.w3.org/1999/xhtml" class="cont"><xsl:attribute name="id">
                <xsl:value-of select="@n"/></xsl:attribute><i class="symbol">☆</i><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span><xsl:apply-templates/><i class="symbol">☆</i></q></xsl:template>
    
    
    
    <xsl:template match="//tei:mod[@type = 'continue|continue']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><q xmlns="http://www.w3.org/1999/xhtml" class="cont"><xsl:attribute name="id"><xsl:value-of select="@n"/></xsl:attribute><i class="symbol">☆</i><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span><xsl:apply-templates/><i class="symbol">☆</i></q></xsl:template>
    
    
    <xsl:template match="//tei:mod[@type = 'chapters']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><a xmlns="http://www.w3.org/1999/xhtml" class="mod chap"><xsl:attribute name="id">
                <xsl:value-of select="@n"/>
            </xsl:attribute><i class="symbol">☆</i><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span><xsl:apply-templates/><i class="symbol">☆</i></a></xsl:template>
    
    
    
    <xsl:template match="//tei:add[@type = 'chapters']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><a xmlns="http://www.w3.org/1999/xhtml" class="add chap"><xsl:attribute name="id">
                <xsl:value-of select="@n"/>
            </xsl:attribute><i class="symbol">☆</i><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span><xsl:apply-templates/><i class="symbol">☆</i></a></xsl:template>
    
    
    
    <xsl:template match="//tei:del[@type = 'chapters']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><s xmlns="http://www.w3.org/1999/xhtml" class="del chap"><xsl:attribute name="id">
            <xsl:value-of select="@n"/></xsl:attribute><i class="symbol">☆</i><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span><xsl:apply-templates/><i class="symbol">☆</i></s></xsl:template>
    
    
    
    
    
    <xsl:template match="//tei:del[@type = 'context']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><s xmlns="http://www.w3.org/1999/xhtml" class="del context"><xsl:attribute name="id">
            <xsl:value-of select="@n"/></xsl:attribute><i class="symbol">▷</i><xsl:apply-templates/><i class="symbol">▷</i><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span></s></xsl:template>
    
    
    
    
    <xsl:template match="//tei:del[@type = 'context|continue']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><s xmlns="http://www.w3.org/1999/xhtml" class="del context"><xsl:attribute name="id">
            <xsl:value-of select="@n"/></xsl:attribute><i class="symbol">▷</i><xsl:apply-templates/><i class="symbol">▷</i><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span></s></xsl:template>
    
    
    
    
    <xsl:template match="//tei:del[@type = 'pre-context']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><s xmlns="http://www.w3.org/1999/xhtml" class="del pre-context"><xsl:attribute name="id">
            <xsl:value-of select="@n"/></xsl:attribute><i class="symbol">◁</i><xsl:apply-templates/><i class="symbol">◁</i><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span></s></xsl:template>
    
    
    
    <xsl:template match="//tei:del[@type = 'pre-context|continue']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><s xmlns="http://www.w3.org/1999/xhtml" class="del pre-context"><xsl:attribute name="id">
            <xsl:value-of select="@n"/></xsl:attribute><i class="symbol">◁</i><xsl:apply-templates/><i class="symbol">◁</i><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span></s></xsl:template>
    
    
    <xsl:template match="//tei:add[@type = 'context']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><ins xmlns="http://www.w3.org/1999/xhtml" class="add context"><xsl:attribute name="id">
            <xsl:value-of select="@n"/></xsl:attribute><i class="symbol">►</i><xsl:apply-templates/><i class="symbol">►</i><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span></ins></xsl:template>
    
    
    
    <xsl:template match="//tei:add[@type = 'context|continue']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><ins xmlns="http://www.w3.org/1999/xhtml" class="add context"><xsl:attribute name="id">
            <xsl:value-of select="@n"/></xsl:attribute><i class="symbol">►</i><xsl:apply-templates/><i class="symbol">►</i><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span></ins></xsl:template>
    
    
    
    <xsl:template match="//tei:add[@type = 'interdoc']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><ins xmlns="http://www.w3.org/1999/xhtml" class="add interdoc"><xsl:attribute name="id">
            <xsl:value-of select="@n"/></xsl:attribute><xsl:apply-templates/><span class="n sup">
            <xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span></ins></xsl:template>
    
    
    
    <xsl:template match="//tei:del[@type = 'interdoc']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><del xmlns="http://www.w3.org/1999/xhtml" class="del interdoc"><xsl:attribute name="id">
                <xsl:value-of select="@n"/></xsl:attribute><xsl:apply-templates/><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span></del></xsl:template>
    
    
    <xsl:template match="//tei:add[@type = 'pre-context']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><ins xmlns="http://www.w3.org/1999/xhtml" class="add pre-context"><xsl:attribute name="id">
            <xsl:value-of select="@n"/></xsl:attribute><i class="symbol">◀</i><xsl:apply-templates/><i class="symbol">◀</i><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span></ins></xsl:template>
    
    
    
    <xsl:template match="//tei:add[@type = 'pre-context|continue']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><ins xmlns="http://www.w3.org/1999/xhtml" class="add pre-context"><xsl:attribute name="id">
            <xsl:value-of select="@n"/></xsl:attribute><i class="symbol">◀</i><xsl:apply-templates/><i class="symbol">◀</i><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span></ins></xsl:template>
    
    
    <xsl:template match="//tei:del[@type = 'typo']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><del xmlns="http://www.w3.org/1999/xhtml" class="del typo"><xsl:attribute name="id"><xsl:value-of select="@n"/></xsl:attribute><i class="symbol">△</i><xsl:apply-templates/><i class="symbol">△</i><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span></del></xsl:template>
    
    
    
    
    <xsl:template match="//tei:add[@type = 'typo']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><ins xmlns="http://www.w3.org/1999/xhtml" class="add typo"><xsl:attribute name="id">
            <xsl:value-of select="@n"/></xsl:attribute><i class="symbol">▲</i><xsl:apply-templates/><i class="symbol">▲</i><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span></ins>
    </xsl:template>
    
    
    
    
    <xsl:template match="//tei:add[@type = 'typo|continue']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><ins xmlns="http://www.w3.org/1999/xhtml" class="add typo"><xsl:attribute name="id">
            <xsl:value-of select="@n"/></xsl:attribute><i class="symbol">▲</i><xsl:apply-templates/><i class="symbol">▲</i><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span></ins></xsl:template>
    
    
    
    <xsl:template match="//tei:del[@type = 'translocation']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><s xmlns="http://www.w3.org/1999/xhtml" class="del trans"><xsl:attribute name="id">
            <xsl:value-of select="@n"/></xsl:attribute><i class="symbol">✧</i><xsl:apply-templates/><i class="symbol">✧</i><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span></s></xsl:template>
    
    
    
    
    <xsl:template match="//tei:del[@type = 'translocation|continue']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><s xmlns="http://www.w3.org/1999/xhtml" class="del trans"><xsl:attribute name="id">
            <xsl:value-of select="@n"/></xsl:attribute><i class="symbol">✧</i><xsl:apply-templates/><i class="symbol">✧</i><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span></s></xsl:template>
    
    
    
    <xsl:template match="//tei:add[@type = 'translocation']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><ins xmlns="http://www.w3.org/1999/xhtml" class="add trans"><xsl:attribute name="id">
            <xsl:value-of select="@n"/></xsl:attribute><i class="symbol">✦</i><xsl:apply-templates/><i class="symbol">✦</i><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span></ins></xsl:template>
    
    <xsl:template match="//tei:add[@type = 'translocation|continue']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><ins xmlns="http://www.w3.org/1999/xhtml" class="add trans"><xsl:attribute name="id">
        <xsl:value-of select="@n"/></xsl:attribute><i class="symbol">✦</i><xsl:apply-templates/><i class="symbol">✦</i><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span></ins></xsl:template>
    
   
    
    <xsl:template match="//tei:add[@type = 'focus']"><i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><span xmlns="http://www.w3.org/1999/xhtml" class="add focus"><xsl:attribute name="id">
            <xsl:value-of select="@n"/></xsl:attribute><i class="symbol">✦</i><xsl:apply-templates/><i class="symbol">✦</i><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span></span></xsl:template>
    
    
    
    
    <xsl:template match="//tei:add[@type = 'layout']">
        <i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><ins xmlns="http://www.w3.org/1999/xhtml" class="add layout" style="color: #fff;display: none"><xsl:attribute name="id"><xsl:value-of select="@n"/></xsl:attribute><xsl:apply-templates/><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span>.</ins></xsl:template>
    
    
    
    
    <xsl:template match="//tei:del[@type = 'layout']">
        <i xmlns="http://www.w3.org/1999/xhtml" class="line"><xsl:attribute name="id">line<xsl:value-of select="@n"/></xsl:attribute></i><s xmlns="http://www.w3.org/1999/xhtml" class="del layout"><xsl:attribute name="id"><xsl:value-of select="@n"/></xsl:attribute><xsl:apply-templates/><span class="n sup"><xsl:value-of select="@n"/></span><span class="p sup"><xsl:value-of select="@change"/></span>.</s></xsl:template>
    
    <xsl:template match="//tei:material">
        <li xmlns="http://www.w3.org/1999/xhtml">
            <a><xsl:attribute name="class">dropdown-item</xsl:attribute><xsl:attribute name="href"><xsl:value-of select="@corresp"/></xsl:attribute><xsl:text>Sessie-versie </xsl:text><xsl:value-of select="substring-before(@corresp,'_')"/><xsl:text>: sessie </xsl:text><xsl:value-of select="substring-after(@corresp,'_s')"/></a>
        </li>
    </xsl:template>
    
    
</xsl:stylesheet>