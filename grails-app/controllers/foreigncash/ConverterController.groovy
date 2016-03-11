package foreigncash

class ConverterController {

	def converterService

	def index() {
		def rates = converterService.getrates()
		render view: "/convert", model :[rates : rates]
	}
	
	def currency() {
	}
}
