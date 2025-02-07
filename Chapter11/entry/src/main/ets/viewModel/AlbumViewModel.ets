import { AlbumManager } from "../utils/AlbumManager";
import { photoAccessHelper } from "@kit.MediaLibraryKit";

export class AlbumViewModel{
  MIMEType: photoAccessHelper.PhotoViewMIMETypes = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE
  maxSelectNumber: number = 1
  isPhotoTakingSupported: boolean = true
  selectedUris: Array<string> = new Array<string>()

  // 获得相册图片方法
  async getAlbumPhoto(){
    AlbumManager.selectPhoto(
      this.MIMEType,
      this.maxSelectNumber,
      this.isPhotoTakingSupported
    )
      .then(selectedUris => {
        if (selectedUris && selectedUris.length > 0) {
          this.selectedUris = selectedUris
        } else {
          console.log('No photos were selected.');
        }
      })
      .catch((error: Error) => {
        console.error('Failed to select photos:', error.message);
      })
  }
}