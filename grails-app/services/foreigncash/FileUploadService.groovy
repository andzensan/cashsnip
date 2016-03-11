package foreigncash


import org.springframework.web.multipart.MultipartFile
import org.codehaus.groovy.grails.web.context.ServletContextHolder



class FileUploadService {

	boolean transactional = true

	def getRealPath(String path) {
		return ServletContextHolder.servletContext.getRealPath(path)
	}

	def String uploadFile(MultipartFile file, String name, String destinationDirectory) {

		def servletContext = ServletContextHolder.servletContext
		def storagePath = servletContext.getRealPath(destinationDirectory)

		// Create storage path directory if it does not exist
		def storagePathDirectory = new File(storagePath)
		if (!storagePathDirectory.exists()) {
			print "CREATING DIRECTORY ${storagePath}: "
			if (storagePathDirectory.mkdirs()) {
				println "SUCCESS"
			} else {
				println "FAILED"
			}
		}

		// Store file
		if (!file.isEmpty()) {
			def newFile = new File("${storagePath}/${name}")
			if(newFile.exists()) {

				if(!newFile.delete()) {
					println "file is busy"
				}

			}

			file.transferTo(newFile)


			println "Saved file: ${storagePath}/${name}"
			return "${storagePath}/${name}"

		} else {
			println "File ${file.inspect()} was empty!"
			return null
		}
	}
	def boolean deleteFile(String name, String destinationDirectory) {
		def servletContext = ServletContextHolder.servletContext
		def storagePath = servletContext.getRealPath(destinationDirectory)


		def file = new File(storagePath+'/'+name)
		if (!file.exists()) {
			println "file is not found ${storagePath}/${name}"
			return false
		}
		else {
			if(file.delete()) {
				println "file deleted"
				return true
			}else {
				println "error file delete"
			}
		}



	}
}

