import { AlbumViewModel } from '../viewModel/AlbumViewModel'

@Entry
@Component
struct Index {
  @State albumViewModel:AlbumViewModel = new AlbumViewModel()

  build() {
    Stack(){
      this.bgColorView()
      this.cardView()
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  cardView(){
    Column(){
      this.imageCardView()
      Text('12.12.2024')
        .fontSize(17)
        .fontColor(0x999999)
        .fontWeight(600)
        .padding({left:10,top:20})
      Text('See the photos')
        .fontSize(23)
        .fontColor(0x333333)
        .fontWeight(700)
        .padding({left:10,top:10})
    }
    .alignItems(HorizontalAlign.Start)
    .padding(10)
    .backgroundColor(Color.White)
    .borderRadius(16)
  }

  @Builder
  imageCardView(){
    Column() {
      if (this.albumViewModel.selectedUris.length > 0) {
        this.imageView(this.albumViewModel.selectedUris[0])
      } else {
        this.addBtnView()
      }
    }
  }

  @Builder
  addBtnView(){
    Stack() {
      Rect({ width: 280, height: 240 })
        .fill(0xF5F5F5)
        .radius(16)
        .stroke(0xE5E5E5)
      SymbolGlyph($r('sys.symbol.plus'))
        .fontSize(23)
    }
    .onClick(() => {
      this.albumViewModel.getAlbumPhoto()
    })
  }

  @Builder
  imageView(imageUri:string){
    Image(imageUri)
      .objectFit(ImageFit.Cover)
      .size({width:280,height:240})
      .border({ width: 1 })
      .borderRadius(16)
      .borderColor(0xE5E5E5)
      .onClick(() => {
        this.albumViewModel.selectedUris = new Array<string>()
      })
  }

  @Builder
  bgColorView(){
    Column()
      .size({width:'100%',height:'100%'})
      .backgroundColor(0x6BB8DD)
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }
}