package foreigncash
import grails.converters.XML
class IndexController {

	def index() {
		def newsrss
		try{
			newsrss=XML.parse("http://twitrss.me/twitter_user_to_rss/?user=theibns".toURL().text)
		}catch(Exception e){
			println e.message
		}
		render view:'/index', model:[newsrss:newsrss.channel.item]
	}
}
