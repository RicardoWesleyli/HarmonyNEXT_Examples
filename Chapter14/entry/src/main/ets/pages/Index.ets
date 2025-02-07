import { TitleBarAttribute, TitleView } from '../component/TitleView'
import { NameModel } from '../model/NameModel'
import { NameCardView } from '../component/NameCardView'
import { NameViewModel } from '../viewmodel/ViewModel'
import { AddView } from './AddView'

@Entry
@Component
struct Index {
  @State titleBarAttribute: TitleBarAttribute = new TitleBarAttribute(true, $r('sys.symbol.square_grid_2x2'), '布局', () => {this.isVertical = !this.isVertical}, '取名画册', true, $r('sys.symbol.plus'), '新增', () => { this.dialogController.open() })
  @State isVertical:boolean = true
  @State viewModel : NameViewModel = new NameViewModel()

  dialogController: CustomDialogController = new CustomDialogController({
    builder: AddView({viewModel:this.viewModel}),
    alignment: DialogAlignment.Bottom
  })

  aboutToAppear(): void {
    this.viewModel.fetchData()
  }

  build() {
    Column() {
      TitleView({titleBarAttribute:this.titleBarAttribute})
      NameCardView({ nameList: this.viewModel.nameList,isVertical:this.isVertical})
    }
    .height('100%')
    .width('100%')
  }
}
