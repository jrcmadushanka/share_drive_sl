class FileReferenceHelper{

  static generateFileName(String email, String type){
    return email + "_" + type;
  }

  static String getFileExtension(String fileName) {
    return "." + fileName.split('.').last;
  }
}
