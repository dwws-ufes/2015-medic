class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
		
		//"/patient#?"(controller: 'patient', action: "rdf")
        "/"(controller: 'patient', action:"index")
		//"/rdf"(controller: 'RDF', action:"rdf")
        "500"(view:'/error')
	}
}
