package foreigncash



import org.grails.plugins.wslite.WsliteConnector



class ConverterService{

	
	static transactional = false
	static scope = "session"
	Map rates = [:]

	def getrates() {

		def newrates = [:] as Map
		def rusrates = [:] as Map
		def eurorates = [:] as Map

		if(!rates) {
			try {
				WsliteConnector.instance.withSoap(serviceURL: 'http://www.cbr.ru/DailyInfoWebServ/DailyInfo.asmx') {
					def response = send (SOAPAction: "http://web.cbr.ru/GetCursOnDateXML"){
						body {
							GetCursOnDateXML(xmlns:"http://web.cbr.ru/") {
								On_date(java.util.Calendar.instance.format("yyyy-MM-dd"))
							}
						}
					}

					def dol
					response.GetCursOnDateXMLResponse.GetCursOnDateXMLResult.ValuteData.ValuteCursOnDate.each{
						if(it.VchCode=="USD"){
						dol= it.Vcurs.toDouble()
						}
					}
					response.GetCursOnDateXMLResponse.GetCursOnDateXMLResult.ValuteData.ValuteCursOnDate.each{

						def current = (it.Vnom.toDouble())/(it.Vcurs.toDouble())*dol
						rusrates.put(it.VchCode.toString(),(it.VchCode.toString()!="USD") ? current : 1.toDouble())
					}
				}
			}catch(e) {
				println e.message
			}

			try {
				def eurobank = "http://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml"


				def xml = new groovy.util.XmlParser().parse(eurobank)
				def dol = xml.Cube.Cube.Cube.find{it."@currency".contains("USD")}."@rate".toDouble()
				xml.Cube.Cube.Cube.each {
					def current = 1/dol*it."@rate".toDouble()
					eurorates.put(it."@currency".toString(), (it."@currency".toString()!="USD") ? current : 1.toDouble())
				}

			}catch(e) {
				println e.message
			}

			rusrates.each {
				//				println it.key
				newrates.put(it.key, it.value)
			}

			eurorates.each {
				//				println it.key
				newrates.put(it.key, it.value)
			}
			rates=newrates
		}
		return rates
	}
}
