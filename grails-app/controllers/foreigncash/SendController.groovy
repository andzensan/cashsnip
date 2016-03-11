package foreigncash



import grails.converters.JSON
import grails.plugin.mail.MailService;




class SendController {


	def index() {
		render view: "/contact"
	}

	def cred() {
	}

	def letter() {


		try {
			sendMail {

				to "info@foreigncash.net"
				subject "Foreign Cash site proposal"
				body params.letter
			}
			flash.message= "Sent!"
		} catch(Exception e) {
			flash.message= "Did not send!" + e.message
		}
		render view: "/contact"
	}
}
