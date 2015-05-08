<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>
            <g:layoutTitle default="Grails"/>
        </title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	<body>

        <div class="container">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <h1><label /></h1>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-md-2 column">
                </div>
                <div class="col-md-8 column">

                    <nav class="navbar navbar-default">
                        <div class="container-fluid">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="">Medic</a>
                            </div>

                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav">
                                    <g:each var="c" in="${grailsApplication.domainClasses.sort { it.fullName } }">
                                        <g:if test="${!['User', 'Role', 'UserRole', 'Prescription'].contains(c.name)}">
                                            <li><a href="${createLink(controller: c.name, action: 'index')}">${message(code: c.name.toLowerCase()+'.label', default: c.name)}</a></li>
                                        </g:if>
                                    </g:each>

                                </ul>
                            </div>
                        </div>
                    </nav>
                    <g:layoutBody/>
                </div>

                <div class="col-md-2 column">
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-md-12 column">

                </div>
            </div>
        </div>
	</body>
</html>
