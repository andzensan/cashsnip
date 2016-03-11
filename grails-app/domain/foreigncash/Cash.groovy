package foreigncash

class Cash {

	Seo seo
	CashType type
	Integer par
	String name
	boolean current = true
	String year
	String description
	Image front
	Image frontsmall
	Image back

	static belongsTo = [currency: Currency]

	static constraints = {
		name nullable : true
		description nullable : true
		seo nullable : true
		front nullable : true
		frontsmall nullable : true
		back nullable : true
	}
	static mapping = {
		description type : "text"
	}


	static def List randomthree() {
		Random r = new Random()
		def all = Cash.list()
		def c = all.size()
		return [
			all[r.nextInt(c)],
			all[r.nextInt(c)],
			all[r.nextInt(c)]
		]
	}
}

