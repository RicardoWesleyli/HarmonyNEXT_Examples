import { BookDataModel } from '../model/BookModel'
import { BookViewModel } from '../viewModel/BookViewModel'

@Entry
@Component
struct Index {
  @State bookViewModel:BookViewModel = new BookViewModel()

  build() {
    Navigation(){
      List({space:20}) {
        ForEach(this.bookViewModel.bookData, (item: BookDataModel) => {
          ListItem() {
            BookItemView({
              name: item.name,
              imageLink: item.imageLink,
              author: item.author,
              recommendation: item.recommendation
            })
          }
        }, (item: BookDataModel) => item.id.toString())
      }
      .width('100%')
      .height('100%')
    }
    .title('MyBook')
  }

  aboutToAppear(){
    this.bookViewModel.fetchBooks()
  }
}

// 书籍项组件
@Component
struct BookItemView {
  @Prop name:string
  @Prop imageLink:string
  @Prop author:string
  @Prop recommendation:string

  build() {
    Row({space:15}){
      WebImageView({imageLink:this.imageLink})

      Column({space:5}) {
        Text(this.name)
          .fontSize(23)
          .fontWeight(600)
        Text(this.author)
          .fontSize(14)
          .fontWeight(600)
          .fontColor(Color.Gray)
        Blank()
        Text(this.recommendation)
          .fontSize(17)
          .fontWeight(600)
      }
      .height('90%')
      .width('100%')
      .alignItems(HorizontalAlign.Start)

      Blank()
    }
    .width('90%')
    .height(120)
    .margin({left:10,right:10})
  }
}


// 网络图片组件
@Component
struct WebImageView {
  @Prop imageLink:string

  build() {
    Column(){
      Image(this.imageLink)
        .alt($r('app.media.background'))
        .width(90)
        .height(120)
        .borderRadius(8)
    }
  }
}