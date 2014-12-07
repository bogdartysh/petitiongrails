package petitionsweb

import org.petitions.*
import grails.converters.JSON

class AddresseeController {

    def index() { }
	
	def all() {
		render Addressee.list() as JSON
	}
}
