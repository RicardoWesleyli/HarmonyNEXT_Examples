@Entry
@Component
struct Index {
  private scroller: Scroller = new Scroller()

  build() {
    Stack() {
      // 背景颜色
      this.bgColorView()

      Column() {
        Blank()

        // “今日天气”栏目
        this.todayWeatherView()

        Blank()

        // “未来天气”栏目
        this.futureWeatherView()

        Blank()

        // “更改地区”按钮
        this.changeAreaBtn()

        Blank()
      }
      .height('100%')
    }
  }

  // 更改地区按钮组件代码块
  @Builder
  changeAreaBtn(){
    Button('更改时间', { type: ButtonType.Normal, stateEffect: true })
      .fontSize(17)
      .fontColor(0x007BFF)
      .borderRadius(16)
      .backgroundColor(Color.White)
      .height(48)
      .width('80%')
  }

  // 未来天气组件代码块
  @Builder
  futureWeatherView(){
    Scroll(this.scroller) {
      Row({ space: 15 }) {
        this.futureWeatherItem('现在', '⛅️', '25°C')
        this.futureWeatherItem('18时', '☀️️', '26°C')
        this.futureWeatherItem('19时', '💨️', '22°C')
        this.futureWeatherItem('20时', '⛅️', '23°C')
        this.futureWeatherItem('21时', '⛅️', '24°C')
        this.futureWeatherItem('22时', '⛅️', '22°C')
        this.futureWeatherItem('23时', '⛅️', '21°C')
        this.futureWeatherItem('0时', '⛅️', '20°C')
      }
    }
    .width('90%')
    .scrollable(ScrollDirection.Horizontal)
  }

  // 时段天气组件代码块
  @Builder
  futureWeatherItem(timeSlot:string,weather:string,temp:string){
    Column({space:10}){
      this.textView(timeSlot,22,600,Color.White)
      this.textView(weather,22,600,Color.White)
      this.textView(temp,22,600,Color.White)
    }
  }

  // 今日天气代码块
  @Builder
  todayWeatherView(){
    Column({space:20}) {
      this.textView('香港特别行政区',32,600,Color.White)
      this.textView('26°C',48,600,Color.White)

      Row({space:10}){
        this.textView('最高',23,600,Color.White)
        this.textView('25°C',32,600,Color.White)
        this.textView('最低',23,600,Color.White)
        this.textView('22°C',32,600,Color.White)
      }

      this.textView('多云☁️',23,600,Color.White)
    }
  }

  // 文字组件代码块
  @Builder
  textView(text:string,size:number,weight:number,color:Color){
    Text(text)
      .fontSize(size)
      .fontWeight(weight)
      .fontColor(color)
  }

  // 背景颜色代码块
  @Builder
  bgColorView(){
    Column()
      .width('100%')
      .height('100%')
      .linearGradient({
        colors: [[0x007BFF, 0.0], [Color.White, 1.0]]
      })
      .expandSafeArea([SafeAreaType.SYSTEM])
  }
}