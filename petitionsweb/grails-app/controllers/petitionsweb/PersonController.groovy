package petitionsweb
import grails.converters.JSON
import org.petitions.Person

class PersonController {

    def index() { 
		render Person.get(params.id) as JSON
		
		
	}
	
	def all() {
		render Person.list() as JSON
	}
	
}
