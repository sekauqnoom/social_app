// 存储选择图片
class SaveData {

  // 存储图片文件
  static  List imagesListFlie=[] ;

  // 存储图片字节码
  static  List imagesList = [];

// 需要删除的图片的id，这些图片为上次上传的图片
  static  String imagesRemoveId = '';

  // 当前坐标
  static double X;
  static double Y;

  // 清除缓存，初始化数据
  static void  clearListFlie(){
    SaveData.imagesListFlie.clear();
    SaveData.imagesList.clear();
    SaveData.imagesRemoveId = "";
  }


}
