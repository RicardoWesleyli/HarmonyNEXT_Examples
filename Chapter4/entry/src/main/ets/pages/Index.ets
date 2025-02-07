@Entry
@Component
struct Index {
  @State showLoading: boolean = false

  build() {
    Column({ space: 20 }) {
      this.actionButton()
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  actionButton(){
    Button() {
      // 水平布局容器
      Row() {
        // 文字
        Text(this.showLoading ? 'Loading' : 'Next')
          .fontSize(20)
          .fontWeight(600)
          .fontColor(this.showLoading ? Color.Gray : Color.White)

        // 空白填充
        Blank()

        // icon
        SymbolGlyph($r(this.showLoading ? 'sys.symbol.rays' : 'sys.symbol.chevron_right'))
          .fontSize(23)
          .fontWeight(FontWeight.Bold)
          .fontColor([this.showLoading ? Color.Gray : Color.White])
      }
      .buttonPadding()
    }
    .backgroundColor(this.showLoading ? '#D5D5D5' : '#54B684')
    .width(160)
    .height(60)
    .onClick(() => {
      this.showLoading = !this.showLoading
    })
  }
}

@Styles
function buttonPadding(){
  .padding({left:20, right:20})
  .width('100%')
}