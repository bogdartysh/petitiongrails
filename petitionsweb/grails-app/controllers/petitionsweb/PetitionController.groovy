package petitionsweb

import grails.converters.JSON

import org.petitions.*

class PetitionController {

	static allowedMethods = [add:'POST']

	def all() {
		render Petition.list() as JSON
	}

	def get() {
		render Petition.get(params.id) as JSON
	}

	def create() {
		[
			addressee:Addressee.get(params.addresseeId)
		]
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
