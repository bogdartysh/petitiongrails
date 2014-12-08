package petitionsweb

import org.petitions.Addressee

class DefaultController {
	static defaultAction = "index"

	def index() {
		[addressees: Addressee.all ]
	}
}
