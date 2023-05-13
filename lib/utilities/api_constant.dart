class ApiConstant {
  static const hostUrl = "http://techblog.sasansafari.com";
  static const baseUrl = "/Techblog/api/";
  static const getHomeItem = "$hostUrl${baseUrl}home/?command=index";
  static const getArtcileList =
      "$hostUrl${baseUrl}article/get.php?command=new&user_id=1";
}
