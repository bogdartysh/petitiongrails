package petitionsweb

import grails.converters.JSON

import org.petitions.*

class PetitionController {

	static allowedMethods = [submit:'POST']

	def all() {
		render Petition.list() as JSON
	}

	def index() {
		[petition: Petition.get(params.id)]
	}

	def create() {
		[addressee: Addressee.get(params.addresseeId)]
	}

	def submit() {
		def existedPetition = Petition.findByTitle(params.title.toString().trim())
		if (existedPetition) {
			params.putAt("addressee",Addressee.get(params.addresseeId))
			params.put("validation", "petition.title.exists")
			params.put("existedPetition", existedPetition)
			render (view:"create", model:params)
		}

		else {
			Petition petition = new Petition(params)
			petition.addressee = Addressee.get(params.addresseeId)
			petition.requestDetails = RequestDetails.find{ userAgent == request.getHeader("User-Agent") && remoteAddr == request.getRemoteAddr() && forwared =="" + request.getHeader("X-Forwarded-For")}
			if (petition.requestDetails == null) {
				petition.requestDetails = new RequestDetails(forwared :  "" + request.getHeader("X-Forwarded-For"), userAgent : "" + request.getHeader("User-Agent"), remoteAddr : "" + request.getRemoteAddr())
				petition.requestDetails.save(flush:true, failOnError:true)
			}
			petition.save(flush:true, failOnError:true)
			render (view: "index", model:[petition: petition])
		}
	}
}
