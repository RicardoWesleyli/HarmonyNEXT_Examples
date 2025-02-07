import { MackData, ToolsModel } from '../model/ToolsModel'
import { ToolsViewModel } from '../viewModel/ToolsViewModel'

@Entry
@Component
struct Index {
  @State toolsViewModel: ToolsViewModel = new ToolsViewModel()
  dialogController: CustomDialogController = new CustomDialogController({
    builder: ToolsDetailView({
      toolsModel:this.toolsViewModel.toolsModel
    }),
    alignment: DialogAlignment.Bottom
  })

  build() {
    Navigation() {
      Grid() {
        ForEach(MackData.getTools(), (item: ToolsModel) => {
          GridItem() {
            ToolsItem({ name: item.name, image: item.image })
              .onClick(()=>{
                this.toolsViewModel.toolsModel = item
                this.dialogController.open()
              })
          }
        }, (item: ToolsModel) => item.id.toString())
      }
      .columnsTemplate('1fr 1fr')
      .rowsGap(48)
      .scrollBar(BarState.Off)
    }
    .title('鸿蒙赋能套件')
  }
}

@CustomDialog
struct ToolsDetailView{
  controller?: CustomDialogController
  toolsModel: ToolsModel | null = null

  build() {
    Column({space:32}){
      Column() {
        this.closeBtnView()
      }
      .onClick(() => {
        if (this.controller != undefined) {
          this.controller.close()
        }
      })

      ToolsItem({ name: this.toolsModel?.name, image: this.toolsModel?.image })

      Text(this.toolsModel?.description)
        .fontSize(17)
        .fontWeight(600)
        .fontColor(Color.Black)

      this.moreBtnView()
    }
    .margin(20)
  }

  @Builder
  closeBtnView(){
    Row() {
      Blank()
      SymbolGlyph($r('sys.symbol.xmark_circle_fill'))
        .fontSize(32)
        .fontColor([Color.Gray])
    }
    .width('100%')
  }

  @Builder
  moreBtnView(){
    Button('查看更多', { type: ButtonType.Normal, stateEffect: true })
      .borderRadius(8)
      .backgroundColor(0x121212)
      .width('60%')
      .height(48)
  }
}

@Component
struct ToolsItem {
  private name:string = ''
  private image:string = ''

  build() {
    Column({ space: 15 }) {
      Image($rawfile(this.image))
        .objectFit(ImageFit.Auto)
        .width(100)
      Text(this.name)
        .fontSize(17)
        .fontWeight(600)
        .fontColor(Color.Black)
    }
  }
}