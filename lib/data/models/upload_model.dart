class UploadModel {
  String originalName;
  String mimeType;
  int fileSize;
  String fileName;
  String path;
  String pathThumbnail;

  UploadModel({
    required this.originalName,
    required this.mimeType,
    required this.fileSize,
    required this.fileName,
    required this.path,
    required this.pathThumbnail,
  });

  factory UploadModel.fromMap(Map<String, dynamic> object) => UploadModel(
        originalName: object['originalName'] ?? '',
        mimeType: object['mimeType'] ?? '',
        fileSize: object['fileSize'] ?? 0,
        fileName: object['fileName'] ?? '',
        path: object['path'] ?? '',
        pathThumbnail: object['pathThumbnail'] ?? '',
      );
}
