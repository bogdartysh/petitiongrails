package petitionsweb

class DefaultController {
	static defaultAction = "index"

	def index() {
		render "hello"
	}
}
