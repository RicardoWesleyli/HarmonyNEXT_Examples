@Entry
@Component
struct Index {
  @State mainColor: Color = 0xE86B67
  @State timeCount: number = 10000
  textTimerController: TextTimerController = new TextTimerController()
  @State isStart: boolean = false
  @State isPause: boolean = false
  private timeRange: string[] = ['1 minute', '2 minute', '3 minute', '4 minute', '5 minute']
  dialogController: CustomDialogController = new CustomDialogController({
    builder: FinishDialogView({
      isStart: this.isStart,
      isPause: this.isPause,
      textTimerController: this.textTimerController
    }),
    alignment: DialogAlignment.Bottom
  })

  build() {
    Stack() {
      this.bgColorView()
      Column() {
        this.navigationView()
        Blank()
        this.timerTextView()
        Blank()
        this.imageView()
        Blank()
        this.btnGroupView()
      }
      .height('100%')
    }
    .height('100%')
    .width('100%')
  }

  showTextPickerDialog(){
    TextPickerDialog.show({
      range:this.timeRange,
      selected:0,
      selectedTextStyle: {color: this.mainColor},
      acceptButtonStyle: {fontColor: this.mainColor},
      cancelButtonStyle: {fontColor: Color.Gray},
      alignment: DialogAlignment.Bottom,
      onAccept: (value: TextPickerResult) => {
        let selectNumber = value.index as number
        this.timeCount = (selectNumber+1) * 60000
      }
    })
  }

  @Builder
  navigationView(){
    Row() {
      Text('CountDown Timer')
        .fontSize(23)
        .fontWeight(800)
        .fontColor(Color.White)
      Blank()
      SymbolGlyph($r('sys.symbol.gearshape'))
        .fontSize(23)
        .fontColor([Color.White])
        .onClick(()=>{
          this.showTextPickerDialog()
        })
    }
    .width('100%')
    .padding({left:20,right:20})
  }

  @Builder
  btnGroupView(){
    if (this.isStart && !this.isPause) {
      this.activeView()
    } else if (this.isPause) {
      this.pausedView()
    } else {
      this.startView()
    }
  }

  @Builder
  imageView(){
    Column({space:32}) {
      Image($r('app.media.cat'))
        .objectFit(ImageFit.Cover)
        .size({ width: 120 })
      Text('Cat is growing...')
        .fontWeight(600)
        .fontColor(Color.White)
    }
  }

  @Builder
  timerTextView(){
    TextTimer({ isCountDown: true, count: this.timeCount, controller: this.textTimerController })
      .format('mm:ss')
      .fontColor(Color.White)
      .fontSize(68)
      .fontWeight(800)
      .onTimer((utc: number, elapsedTime: number) => {
        if (elapsedTime*1000 == this.timeCount ) {
          this.dialogController.open()
        }
      })
  }

  @Builder
  bgColorView() {
    Column()
      .size({ width: '100%', height: '100%' })
      .backgroundColor(this.mainColor)
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }

  @Builder
  startView(){
    BtnView({ btnName: 'Start', btnFontColor: this.mainColor, btnColor: Color.White })
      .onClick(()=>{
        this.isStart = true
        this.textTimerController.start()
      })
  }

  @Builder
  activeView(){
    Row({ space: 20 }) {
      BtnView({ btnName: 'PAUSE', btnFontColor: this.mainColor, btnColor: Color.White })
        .onClick(()=>{
          this.isPause = true
          this.isStart = false
          this.textTimerController.pause()
        })
      BtnView({ btnName: 'CANCEL', btnFontColor: Color.White, btnColor: this.mainColor })
        .onClick(()=>{
          this.isStart = false
          this.textTimerController.reset()
        })
    }
  }

  @Builder
  pausedView(){
    BtnView({ btnName: 'Go On', btnFontColor: this.mainColor, btnColor: Color.White })
      .onClick(()=>{
        this.isStart = true
        this.isPause = false
        this.textTimerController.start()
      })
  }
}

@CustomDialog
struct FinishDialogView {
  controller?: CustomDialogController
  @Link isStart: boolean
  @Link isPause: boolean
  textTimerController?: TextTimerController

  build() {
    Column({space:32}) {
      Text('Congratulations!')
        .fontSize(23)
        .fontWeight(600)
        .fontColor(0xBE4C48)
        .margin({top:32})
      Stack() {
        Progress({ value: 100, total: 100, type: ProgressType.Ring })
          .size({ width: 140 })
          .color(0xBE4C48)
          .style({ strokeWidth: 10 })
        Text('100%')
          .fontSize(23)
          .fontColor( 0xBE4C48)
      }
      BtnView({ btnName: 'Got it', btnFontColor: Color.White, btnColor: 0xBE4C48 })
        .onClick(() => {
          if (this.controller != undefined) {
            this.isStart = false
            this.isPause = false

            if (this.textTimerController != undefined) {
              this.textTimerController.reset()
            }

            this.controller.close()
          }
        })
        .margin(20)
    }
  }
}

@Component
struct BtnView {
  @Prop btnName: string
  @Prop btnFontColor: Color
  @Prop btnColor: Color

  build() {
    Button(this.btnName, { type: ButtonType.Normal, stateEffect: true })
      .fontColor(this.btnFontColor)
      .borderRadius(8)
      .backgroundColor(this.btnColor)
      .width(120)
  }
}