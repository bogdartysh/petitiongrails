package petitionsweb

import org.petitions.*
import grails.converters.JSON

class PetitionController {

	static allowedMethods = [add:'POST']
	static defaultAction = "new_ptition"

	def all() {
		render Petition.list() as JSON
	}
	
	def get() {
		render Petition.get(params.id) as JSON
	}
	
	def new_petition() {
		
	}

	def add() {
		if (Petition.findByTitle(params.title.toString().trim())) {
			render "{status='VALIDATION_FAILED', details={errors=['same.title.exists']}}"
		}

		else {
			Petition petition = new Petition(params)
			petition.addressee = Addressee.get(params.addresseeId)

			render "{status='OK', details={saved="+ (petition as JSON) +"}" + "  " + (params as JSON)
		}
	}
}
