package petitionsweb

import org.petitions.*

import com.megatome.grails.RecaptchaService

class PetitionController {
	static defaultAction = "index"

	static allowedMethods = [submit:'POST']
	RecaptchaService recaptchaService
	def oauthService

	def all() {
		render Petition.list() as JSON
	}

	def index() {
		[petition: Petition.read(params.id)]
	}

	def create() {
		[addressee: Addressee.read(params.addresseeId), validation:params?.validation]
	}

	def open() {
		def addressee = Addressee.read(params.addresseeId);
		[petitions: Petition.findAllByClosedOnIsNullAndConsiderabilityThresholdReachedOnIsNotNullAndAdressee(addressee),
			qtynotsearchable: Petition.findAllByClosedOnIsNullAndConsiderabilityThresholdReachedOnIsNull().size()
		]
	}

	def resolved() {
		def addressee = Addressee.read(params.addresseeId)
		[petitions: Petition.findAllByClosedOnIsNotNullAndConsiderabilityThresholdReachedOnIsNotNullAndAddressee(addressee)
		]
	}

	@Secured([
		'ROLE_ADMIN',
		'ROLE_SUPERUSER',
		'ROLE_USER'
	])
	def submit() {
		if (!recaptchaService.verifyAnswer(session, request.getRemoteAddr(), params) ) {
			params.put("validation", "petition.recaptcha.verification.failed")
			redirect (uri:"/petition/create?addresseeId=" +params.addresseeId +"&validation=petition.recaptcha.verification.failed", model:params)
		}
		else {
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
				petition.remoteAddr = ("petition"  + request.getHeader("X-Forwarded-For") + request.getRemoteAddr()).encodeAsSHA256()
				petition.save()
				redirect (action:"index", id: petition.id)
			}
		}
	}
}
