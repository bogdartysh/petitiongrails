package petitionsweb
import grails.converters.JSON

import org.petitions.Person

class PersonController {

	def index() {
		[person: Person.get(params.id)]
	}

	def all() {
		render Person.list() as JSON
	}
}
