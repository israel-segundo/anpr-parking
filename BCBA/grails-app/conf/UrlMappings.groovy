class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"search", action:"automaticSearch")
		"500"(view:'/error')
	}
}
