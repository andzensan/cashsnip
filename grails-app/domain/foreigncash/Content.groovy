package foreigncash

class Content {

	Seo seo
	String title
	Section section
	String text
	List<Image> images
	Date dateCreated
	boolean published = false


	static hasMany = [images:Image]

	static constraints = {
		title blank:false
		section: blank:false
		images nullable:true
		text nullable:true
		seo nullable : true
	}
	static mapping = { text type: 'text' }
	String toString(){
		return title
	}
	
}
