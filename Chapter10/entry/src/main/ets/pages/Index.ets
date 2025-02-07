import { SegmentButton, SegmentButtonOptions } from '@kit.ArkUI'

// 初始化PersistentStorage
PersistentStorage.persistProp("darkMode", ThemeColorMode.LIGHT)

@Entry
@Component
struct Index {
  @State imageColor: string = '#FFCC00'
  @State isVisibility: Visibility = Visibility.None
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [{ text: '浅色' }, { text: '深色' }],
    selectedFontColor: Color.Black
  })
  @State @Watch('toggleColorMode') tabSelectedIndexes: number[] = [0]
  @StorageLink("darkMode") colorMode: ThemeColorMode = ThemeColorMode.LIGHT

  build() {
    WithTheme({ colorMode: this.colorMode }) {
      Flex({
        direction: FlexDirection.Column,
        alignItems: ItemAlign.Center,
        justifyContent: FlexAlign.SpaceEvenly,
      }) {
        this.themeImageView()
        this.featureInfoView()
        this.switchBtnView()
      }
      .height('100%')
      .width('100%')
      .backgroundColor($r('sys.color.background_primary'))
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.END, SafeAreaEdge.BOTTOM, SafeAreaEdge.START])
    }
  }

  aboutToAppear(): void {
    this.toggleColorMode()
    this.tabSelectedIndexes = this.colorMode === ThemeColorMode.LIGHT ? [1] : [0]
  }

  toggleColorMode(): void {
    this.colorMode = this.colorMode === ThemeColorMode.LIGHT ? ThemeColorMode.DARK : ThemeColorMode.LIGHT
    this.imageColor = this.colorMode === ThemeColorMode.LIGHT ? '#FFCC00' : '#8B87F7'
    this.isVisibility = this.colorMode === ThemeColorMode.LIGHT ? Visibility.None :Visibility.Visible

    // 更新持久化存储
    PersistentStorage.persistProp("darkMode", this.colorMode)
  }

  @Builder
  switchBtnView(){
    SegmentButton({
      options: this.tabOptions,
      selectedIndexes: $tabSelectedIndexes
    })
      .width('60%')
  }

  @Builder
  themeImageView() {
    Stack() {
      Circle()
        .size({ width: 150, height: 150 })
        .fill(this.imageColor)
      Circle()
        .size({ width: 150, height: 150 })
        .fill(Color.Black)
        .offset({ x: 30, y: -25 })
        .visibility(this.isVisibility)
    }
  }

  @Builder
  featureInfoView(){
    Column({space:20}) {
      Text("主题风格")
        .fontSize(23)
        .fontWeight(600)
      Column({ space: 10 }) {
        Text("明亮或柔和，白昼或黑夜。")
        Text("快速设置你的界面。")
      }
    }
  }
}