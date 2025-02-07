import { NameModel } from "../model/NameModel"
import { font } from "@kit.ArkUI"

@Component
export struct NameCardView {
  @Prop nameList: NameModel[]
  @Link isVertical:boolean

  aboutToAppear() {
    font.registerFont({
      familyName: 'CustomFont',
      familySrc: $rawfile('SpringBreeze.ttf')
    })
  }

  build() {
    if (this.isVertical) {
      Swiper(){
        ForEach(this.nameList, (item:NameModel) => {
          SwiperItemView({item:item})
        })
      }
    } else {
      List() {
        ForEach(this.nameList, (item: NameModel) => {
          ListItem() {
            ListItemView({ item: item })
          }
          .size({ width: '100%', height: 120 })
        })
      }
      .listDirection(Axis.Vertical)
      .scrollBar(BarState.Off)
      .margin(20)
    }
  }
}

@Component
struct ListItemView {
  @Prop item: NameModel

  build() {
    Stack() {
      this.bgImageView()

      Row() {
        Column({ space: 5 }) {
          Text(this.item.name)
            .fontSize(48)
            .fontColor(Color.White)
            .fontFamily('CustomFont')
          Text(this.item.meaning)
            .fontSize(20)
            .fontColor(Color.White)
            .fontFamily('CustomFont')
        }
        .alignItems(HorizontalAlign.Start)
        Blank()
      }
      .padding({left:20})
      .width('100%')
    }
    .backgroundColor(this.item.backgroundColor)
    .borderRadius(32)
    .margin({top:10})
  }

  @Builder
  bgImageView(){
    Image($r('app.media.shuimohua'))
      .objectFit(ImageFit.Cover)
      .opacity(0.2)
      .borderRadius(32)
  }
}

@Component
struct SwiperItemView {
  @Prop item: NameModel

  build() {
    Stack() {
      this.bgImageView()

      Column({ space: 20 }) {
        Blank()
        this.nameTextView(this.item.name)
        Blank()
        this.meaningTextView(this.item.meaning)
        Blank()
      }
      .size({width:'100%',height:'80%'})
    }
    .backgroundColor(this.item.backgroundColor)
    .borderRadius(32)
    .margin({top:40,bottom:40,left:20,right:20})
  }

  @Builder
  bgImageView(){
    Image($r('app.media.shuimohua'))
      .objectFit(ImageFit.Cover)
      .opacity(0.2)
      .borderRadius(32)
  }

  @Builder
  nameTextView(name:string){
    Column({space:5}) {
      ForEach(name.split(''), (item: string) => {
        Text(item)
          .fontSize(88)
          .fontWeight(600)
          .textAlign(TextAlign.Center)
          .fontColor(Color.White)
          .fontFamily('CustomFont')
      })
    }
  }

  @Builder
  meaningTextView(meaning:string){
    Column({space:10}) {
      Text('- 名字寓意 -')
        .fontSize(23)
        .fontColor('#999999')
        .fontFamily('CustomFont')
      Text(meaning)
        .fontSize(24)
        .fontWeight(600)
        .fontColor(Color.White)
        .fontFamily('CustomFont')
    }
  }
}