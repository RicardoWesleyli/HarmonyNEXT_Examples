const local = new LocalStorage()

@Entry(local)
@Component
struct MonthlyThemeWidgetCard {
  @LocalStorageProp("week") week: string = 'Sunday'
  @LocalStorageProp("day") day: number = 5
  @State formLinkOptions:FormLinkOptions = {
    action: "router",
    abilityName: "EntryAbility",
    params: { 'message': 'Router to Index' }
  }

  build() {
    FormLink(this.formLinkOptions) {
      Column() {
        this.cardBarView()
        Blank()
        this.dateTextView()
        Blank()
      }
      .cardStyles()
    }
  }

  @Builder
  cardBarView(){
    Row({space:5}) {
      SymbolGlyph($r('sys.symbol.heart_fill'))
        .fontColor([0xEB5164])
        .fontSize(17)
      Text(this.week)
        .fontSize(14)
        .fontWeight(600)
        .fontColor(Color.Black)
        .opacity(0.5)
      Blank()
      SymbolGlyph($r('sys.symbol.chevron_right'))
        .fontColor([Color.Black])
        .opacity(0.5)
    }
    .width('100%')
    .padding(10)
  }

  @Builder
  dateTextView(){
    Text(this.day.toString())
      .fontSize(68)
      .fontWeight(600)
      .fontColor(0xEB5164)
  }
}

@Styles
function cardStyles(){
  .size({width:'100%',height:'100%'})
  .linearGradient({
    angle: 45,
    colors: [[0xde707f, 0.0], [0xf0b2ae, 1.0],]
  })
}