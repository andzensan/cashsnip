package foreigncash

class EnvController {

    def index() { 
		render java.lang.System.getenv("VCAP_SERVICES")
	}
}
