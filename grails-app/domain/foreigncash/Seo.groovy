package foreigncash

class Seo {

	String title
	String keywords
	String description
    static constraints = {
 		description type : "text"
		keywords type : "text"
   }
}
