package petitionsweb

import grails.converters.JSON

import org.petitions.*

import com.megatome.grails.RecaptchaService


class PetitionController {

	static allowedMethods = [submit:'POST']
	RequestDetailsDaoService requestDetailsDaoService
	RecaptchaService recaptchaService

	def all() {
		render Petition.list() as JSON
	}

	def index() {
		[petition: Petition.read(params.id)]
	}

	def create() {
		[addressee: Addressee.read(params.addresseeId)]
	}

	def submit() {
		if (!recaptchaService.verifyAnswer(session, request.getRemoteAddr(), params) ) {
			params.put("validation", "petition.recaptcha.verification.failed")
			render (view:"create", model:params)
		}

		def existedPetition = Petition.findByTitle(params.title.toString().trim())
		if (existedPetition) {
			params.putAt("addressee",Addressee.read(params.addresseeId))
			params.put("validation", "petition.title.exists")
			params.put("existedPetition", existedPetition)
			render (view:"create", model:params)
		}

		else {
			Petition petition = new Petition(params)
			petition.addressee = Addressee.read(params.addresseeId)
			petition.requestDetails = requestDetailsDaoService.getPersistedRequestDetails(request)
			petition.save()
			render (view: "index", model:[petition: petition])
		}
	}
}
