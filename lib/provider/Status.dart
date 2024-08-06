class BasicStatus {
  BasicStatus({
    this.title = "Configurator",
    this.isSaved = true,
    this.fileOpend = false,
  });

  bool fileOpend;
  bool isSaved;
  String title;
}

class HardConfStatus {
  bool isSave;
  String filePath;
  String fileName;
  String fileType;
  String fileEncoding;
  String connSoftConf;

  HardConfStatus({
    this.isSave = false,
    this.filePath = "",
    this.fileName = "",
    this.fileType = "",
    this.fileEncoding = "",
    this.connSoftConf = "",
  });
}

class SoftConfStatus {}