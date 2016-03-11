package foreigncash

class ImageController {

    def index() {
		def image = Image.get(params.imageId)
		if (!image) {
		  response.sendError(404)
		  return;
		}
		response.setContentType(image.type)
		response.setContentLength(image.file.size())
		OutputStream out = response.getOutputStream();
		out.write(image.file);
		out.close();
	}
}
