@Entry
@Component
struct Index {
  @State isScale: boolean = false
  @State isAdd: boolean = false

  build() {
    Column({space:48}) {

      Blank()

      this.imageView()

      Column() {
        if (this.isAdd) {
          this.buttonGroupView()
        } else {
          this.plusButtonView()
        }
      }

      Blank()

      if (this.isAdd) {
        this.customTabView()
      }
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  customTabView(){
    Row(){
      Text('$4.28')
        .fontSize(23)
        .fontWeight(600)
        .width('50%')
        .height(60)
        .textAlign(TextAlign.Center)

      Blank()

      Button('去结算')
        .fontSize(20)
        .fontWeight(600)
        .fontColor('#000000')
        .width('50%')
        .height(60)
        .backgroundColor('#F5DC62')
        .borderRadius(32)
    }
    .height(80)
    .width('90%')
    .buttonStyles()
    .transition({
      type: TransitionType.Insert,
      translate: { y: '100%' },
      opacity: 0.3
    })
  }

  @Styles
  buttonStyles(){
    .padding(10)
    .backgroundColor('#F5F5F5')
    .borderRadius(32)
  }

  @Builder
  buttonGroupView(){
    Row(){
      this.buttonView('sys.symbol.minus')
      Blank()
      Text('1').fontSize(23)
      Blank()
      this.buttonView('sys.symbol.plus')
    }
    .width(140)
    .buttonStyles()
  }

  @Builder
  plusButtonView(){
    Column() {
      this.buttonView('sys.symbol.plus')
    }
    .buttonStyles()
    .onClick(() => {
      animateTo({ duration: 500, curve: Curve.Ease }, () => {
        this.isAdd = !this.isAdd
      })
    })
  }

  @Builder
  buttonView(symbolName:string){
    Stack() {
      Circle({width:48,height:48})
        .fill('#F5DC62')

      SymbolGlyph($r(symbolName))
        .fontSize(23)
        .fontWeight(FontWeight.Bold)
        .fontColor([Color.Gray])
    }
  }

  @Builder
  imageView(){
    Image($rawfile('cake1.png'))
      .objectFit(ImageFit.Contain)
      .width(this.isScale ? 250 : 200)
      .animation({ duration: 500, curve: Curve.Ease })
      .onClick(() => {
        this.isScale = !this.isScale
      })
  }
}