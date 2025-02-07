import { NameModel } from "../model/NameModel"
import { NameViewModel } from "../viewmodel/ViewModel"

@CustomDialog
export  struct AddView {
  controller: CustomDialogController
  @State name: string = ''
  @State meaning: string = ''
  @State bgColors: string[] = ['#E96060', '#F3B15A', '#F6B7AE', '#4C8184', '#9F849B', '#7C564F']
  @State selectColorItem: string = this.bgColors[0]
  @ObjectLink viewModel : NameViewModel

  build() {
    Column() {
      this.closeBtn()
      this.inputView()
      this.colorGridView()
      this.submitBtn()
    }.size({width:'100%'})
  }

  @Builder
  submitBtn(){
    Button('保存', { type: ButtonType.Capsule, stateEffect: true })
      .backgroundColor(0x317aff)
      .height(45)
      .width('60%')
      .margin({bottom:20})
      .onClick(() => {
        if (this.name.trim() === '') {
          this.viewModel.showToast('请输入名字')
        } else if (this.meaning.trim() === '') {
          this.viewModel.showToast('请输入名字寓意')
        } else {
          let newName: NameModel = {
            id: this.viewModel.nameList.length + 1,
            name: this.name,
            meaning: this.meaning,
            backgroundColor: this.selectColorItem
          }
          this.viewModel.addData(newName)
          this.controller.close()
        }
      })
  }

  @Builder
  closeBtn(){
    Row() {
      Blank()
      SymbolGlyph($r('sys.symbol.xmark_circle_fill'))
        .fontSize(32)
        .fontColor([0x999999])
    }
    .width('90%')
    .margin(20)
    .onClick(()=>{
      this.controller.close()
    })
  }

  @Builder
  inputView(){
    Column({space:20}){
      TextInput({ text: this.name, placeholder: '名字'})
        .onChange((value) => {
          this.name = value;
        })
      TextArea({ text: this.meaning, placeholder: '名字寓意'})
        .height(120)
        .onChange((value) => {
          this.meaning = value;
        })
    }
    .margin({left:20,right:20})
  }

  @Builder
  colorGridView(){
    Grid() {
      ForEach(this.bgColors, (color: string) => {
        GridItem() {
          Row()
            .size({width:'100%',height:60})
            .backgroundColor(color)
            .borderRadius(16)
            .border({color: color === this.selectColorItem ? Color.Green : Color.Transparent, width: 4})
            .onClick(() => {
              this.selectColorItem = color
            })
        }
      })
    }
    .columnsTemplate('1fr 1fr 1fr 1fr')
    .columnsGap(10)
    .rowsGap(10)
    .padding(20)
    .backgroundColor(0xF5F5F5)
    .borderRadius(32)
    .height(200)
    .margin(20)
  }
}