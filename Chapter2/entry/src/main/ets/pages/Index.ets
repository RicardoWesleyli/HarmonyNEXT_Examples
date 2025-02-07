@Entry

@Component
struct Index {
  @State recommendedFood: string = ''

  build() {
    Column({space:32}) {
      Image($rawfile('cake.png'))
        .objectFit(ImageFit.Contain)
        .height(300)

      Text('今天想吃什么？')
        .fontSize(32)
        .fontWeight(600)

      Text(this.recommendedFood)
        .fontSize(17)
        .fontColor('#F55A42')
        .fontWeight(600)

      Button('帮我推荐')
        .fontSize(20)
        .width(140)
        .height(48)
        .onClick(()=>{
            // 调用推荐食物的方法
            this.recommendFood()
        })
    }
    .height('100%')
    .width('100%')
    .margin({top: 48})
  }

  // 推荐食物的方法
  recommendFood() {
    const foods = ['猪脚饭','螺蛳粉','麻辣烫','拉面',
      '寿司','披萨','汉堡']
    const index = Math.floor(Math.random() * foods.length)
    this.recommendedFood = foods[index]
  }
}