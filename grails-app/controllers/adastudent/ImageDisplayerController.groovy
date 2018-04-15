package adastudent

class ImageDisplayerController {

    def productimage () {

        def photoPath    = "/home/projects/ada/product/images"
        def photoName    = params?.photoName
        def dir          = params?.dir
        if(!dir){
            dir=''
        }

        String specificFolder
        File photo

        try {
            if (photoName.isEmpty() || photoName==null || photoName.equals("null")) {
                specificFolder = "/projects/conprise/images/default"
                photo = new File(specificFolder+".png")
                response.setHeader("Content-disposition", "inline")
            } else {
                specificFolder = photoPath
                photo = new File(specificFolder + File.separator+dir+File.separator+photoName)
                response.setHeader("Content-disposition", "inline")
            }
            if(!photo.exists()){
                specificFolder = photoPath
                photo = new File(specificFolder + File.separator+'home'+File.separator+photoName)
                response.setHeader("Content-disposition", "inline")
            }

            if (photo.exists()) {
                response.setContentType("image/jpeg")
                response.outputStream << (photo.bytes)
                response.outputStream.flush()
                response.setHeader("Content-disposition", "inline")
            }
        } catch (Exception e) {
            e.stackTrace
        }
        return
    }
    def companyImage () {

        def photoPath    = "/home/projects/ada/company/images"
        def photoName    = params?.photoName
        def dir          = params?.dir
        if(!dir){
            dir=''
        }

        String specificFolder
        File photo

        try {
            if (photoName.isEmpty() || photoName==null || photoName.equals("null")) {
                specificFolder = "/projects/conprise/images/default"
                photo = new File(specificFolder+".png")
                response.setHeader("Content-disposition", "inline")
            } else {
                specificFolder = photoPath
                photo = new File(specificFolder + File.separator+dir+File.separator+photoName)
                response.setHeader("Content-disposition", "inline")
            }
            if(!photo.exists()){
                specificFolder = photoPath
                photo = new File(specificFolder + File.separator+'home'+File.separator+photoName)
                response.setHeader("Content-disposition", "inline")
            }

            if (photo.exists()) {
                response.setContentType("image/jpeg")
                response.outputStream << (photo.bytes)
                response.outputStream.flush()
                response.setHeader("Content-disposition", "inline")
            }
        } catch (Exception e) {
            e.stackTrace
        }
        return
    }

}

