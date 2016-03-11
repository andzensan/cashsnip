package foreigncash

class CurrencyController {

	def index() {
		redirect action:'list'
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 12, 36)
		render view: "/currency", model : [currencyList: Currency.list(sort: 'name'), currencyListTotal: Currency.count()]
	}
	def show(Long id) {
		def currency = Currency.get(id)
		if(currency) {
			render view: '/currency', model: [currencyInstance: currency]
		}else {
			flash.message = "not found"
			redirect action: 'list'
		}
	}
}
