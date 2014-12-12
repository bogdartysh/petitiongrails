class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?(.$format)?"{ constraints { // apply constraints here
			} }

		"/"( controller:'Default', action:'index' )
		"/about"(view:'/about')
		"/contacts"(view:'/contacts')
		"500"(view:'/error')
		"404"(view:'/error')
	}
}
