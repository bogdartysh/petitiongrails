package petitionsweb
import grails.converters.JSON
import org.petitions.Person

class PersonController {

    def index() { 
		render Person.get(params.id) as JSON
		
		
	}
	
}
