package foreigncash



import pl.burningice.plugins.image.BurningImageService;
import grails.plugins.springsecurity.Secured

@Secured(["ROLE_ADMIN"])

class AdminController {

	FileUploadService fileUploadService
	def burningImageService


	def index() {
		redirect(action: "addcurrency")
	}
	def addcurrency() {

		if(params.id) {
			def currencyInstance = Currency.get(params.id)
			render view: "index", model: [currencyInstance: currencyInstance]
		}else {
			render view: "index"
		}
	}
	def genmap() {
		String i = ''
		Currency.list().each {
			i+='<url><loc>http://www.foreigncash.net/currency/show/'+it.id+'</loc></url>'
		}
		Cash.list().each {
			i+='<url><loc>http://www.foreigncash.net/cash/show/'+it.id+'</loc></url>'
		}
		render i
	}
	def uploadrootfile() {

		def dir= new File(fileUploadService.getRealPath("/"))

		if (params.file) {

			def file = request.getFile('file')


			if(!file.isEmpty()) {
				fileUploadService.uploadFile(file, file.getOriginalFilename(), '/')
			}
		}


		render view: "upload", model: [files: dir.listFiles().toList()*.name]
	}
	def savecurrency() {
		def currency
		try {
			if(params.id) {
				currency = Currency.get(params.id)
			}else {
				currency = new Currency()
			}


			currency.properties= params
			if(currency.country) {
				currency.country = []
			}
			if(params.country instanceof String) {
				if(!params.country.isEmpty()) {
					currency.country << params.country
				}
			}else {

				params.country.each {
					if(it.length()>0) {
						currency.country << it
					}
				}
			}

			def symbolimg = request.getFile('image')

			if(!symbolimg.isEmpty()) {

				if (currency.symbolImage) {
					currency.symbolImage.file = symbolimg.bytes
					currency.symbolImage.type = symbolimg.getContentType()
					currency.symbolImage.save(failOnError: true)
				}else {
					currency.symbolImage = new Image(file: symbolimg.bytes, type: symbolimg.getContentType()).save(failOnError: true)
				}
			}
			def flag = request.getFile('flagimage')


			if(!flag.isEmpty()) {


				if (currency.flag) {
					currency.flag.file = flag.bytes
					currency.flag.type = flag.getContentType()
					currency.flag.save(failOnError: true)
				}else {
					currency.flag = new Image(file: flag.bytes, type: flag.getContentType()).save(failOnError: true)
				}
			}

			if(params.seo_description||params.seo_keywords||params.seo_title) {

				def seo

				if(!currency.seo) {
					currency.seo = new Seo(description: params.seo_description,
					keywords:params.seo_keywords,title:params.seo_title).save(failOnError:true)
				}else {
					currency.seo.title = params.seo_title
					currency.seo.description = params.seo_description
					currency.seo.keywords = params.seo_keywords
					currency.seo.save(failOnError:true)
				}
			}
			currency.save(failOnError:true)
		} catch(e) {
			flash.message=e.message
		}

		redirect(action: "addcurrency", params: [id : currency.id])
	}

	def addcash() {
		if(params.id) {
			def cashInstance = Cash.get(params.id)
			render view: "cash", model: [cashInstance: cashInstance, cashList: cashInstance.currency.cash]
		}else {
			render view: "cash"
		}
	}

	def savecash() {
		def cash
		try {
			if(params.id) {
				cash = Cash.get(params.id)
			}else {
				cash = new Cash()
			}
			//			cash.properties=params

			cash.name = params.name
			cash.year = params.year
			cash.par = params.par.toInteger()
			cash.type = params.type
			cash.description = params.description

			def currency = Currency.get(params.currency)
			cash.currency = currency

			def front = request.getFile('frontimage')



			if(!front.isEmpty()) {

				burningImageService.doWith(front, fileUploadService.getRealPath("images/tmp")).execute{

					it.scaleApproximate(900, 400)
				}

				def file = new File(fileUploadService.getRealPath("images/tmp/"+front.getOriginalFilename()))

				if (file.exists()) {
					if (cash.front) {
						cash.front.file = file.bytes
						cash.front.type = front.getContentType()
						cash.front.save(failOnError: true)
					}else {
						cash.front = new Image(file: file.bytes, type: front.getContentType()).save(failOnError: true)
					}
					file.delete()
					file.finalize()
				}

				burningImageService.doWith(front, fileUploadService.getRealPath("images/tmp")).execute{

					it.scaleApproximate(200, 100)
				}
				def smallfile = new File(fileUploadService.getRealPath("images/tmp/"+front.getOriginalFilename()))
				if(smallfile.exists()) {
					if (cash.frontsmall) {
						cash.frontsmall.file = smallfile.bytes
						cash.frontsmall.type = front.getContentType()
						cash.frontsmall.save(failOnError: true)
					}else {
						cash.frontsmall = new Image(file: smallfile.bytes, type: front.getContentType()).save(failOnError: true)
					}
					smallfile.delete()
					smallfile.finalize()
				}
			}
			def back = request.getFile('backimage')

			if(!back.isEmpty()) {
				burningImageService.doWith(back, fileUploadService.getRealPath("images/tmp")).execute{

					it.scaleApproximate(900, 400)
				}
				def file = new File(fileUploadService.getRealPath("images/tmp/"+back.getOriginalFilename()))

				if (file.exists()) {
					if (cash.back) {
						cash.back.file = file.bytes
						cash.back.type = back.getContentType()
						cash.back.save(failOnError: true)
					}else {
						cash.back = new Image(file: file.bytes, type: back.getContentType()).save(failOnError: true)
					}
					file.delete()
					file.finalize()
				}
			}


			if(params.seo_description||params.seo_keywords||params.seo_title) {

				def seo

				if(!cash.seo) {
					cash.seo = new Seo(description: params.seo_description,
					keywords:params.seo_keywords,title:params.seo_title).save(failOnError:true)
				}else {
					cash.seo.title = params.seo_title
					cash.seo.description = params.seo_description
					cash.seo.keywords = params.seo_keywords
					cash.seo.save(failOnError:true)
				}
			}
			cash.save(failOnError:true)

		} catch(e) {
			flash.message=e.message
		}
		redirect(action: "addcash", params: [id : cash.id])

	}

	def cashbycurrency() {
		if(params.id) {
			def currency = Currency.get(params.id)
			render view: "cash", model: [cashList: currency.cash, params:[currencyId:params.id]]
		}
	}
	def addcontent() {
		render view: "index"
	}
}
