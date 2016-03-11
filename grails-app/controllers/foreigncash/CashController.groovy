package foreigncash

class CashController {

	def show(Long id) {
		def cash = Cash.get(id)
		if(cash) {
			render view: '/cash', model: [cashInstance: cash]
		}else {
			flash.message = "not found"
			redirect controller: 'currency',action: 'list'
		}
	}
}
