package foreigncash

import pl.burningice.plugins.image.ast.DBImageContainer

class Currency {
	
	Seo seo
	Set<String> country
	Set<Cash> cash
	String name
	String symbol
	String code
	Image symbolImage
	Boolean top = false
	Image flag
	String description
	
	static hasMany = [country: String, cash: Cash]

	def String toString() {
		return name
	}
    static constraints = {
		seo nullable: true
 		symbolImage nullable: true
		top nullable: true
		flag nullable: true
		description nullable: true
    }
	static mapping = {
		description type : "text"
	}
}
