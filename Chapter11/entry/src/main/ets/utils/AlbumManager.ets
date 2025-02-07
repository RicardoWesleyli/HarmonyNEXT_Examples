import { photoAccessHelper } from '@kit.MediaLibraryKit'

export class AlbumManager {
  static photoPicker = new photoAccessHelper.PhotoViewPicker()

  static async selectPhoto(
    MIMEType: photoAccessHelper.PhotoViewMIMETypes,
    maxSelectNumber: number,
    isPhotoTakingSupported: boolean): Promise<Array<string> | undefined> {
    try {
      const res = await AlbumManager.photoPicker.select({
        MIMEType: MIMEType,
        maxSelectNumber: maxSelectNumber,
        isSearchSupported: true,
        isPhotoTakingSupported: isPhotoTakingSupported
      })

      if (res.photoUris && res.photoUris.length > 0) {
        return res.photoUris
      }
      console.log('No photo selected')
      return undefined
    } catch (err) {
      console.error('Error selecting photo:', err.message)
      throw new Error(`Photo selection error: ${err.message}`)
    }
  }
}