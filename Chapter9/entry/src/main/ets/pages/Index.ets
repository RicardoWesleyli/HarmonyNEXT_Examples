import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct Index {
  @State name: string = ''
  @State email: string = ''
  @State markText:string = ''
  @State selectedDate: Date = new Date()
  @State isOn:boolean = true

  build() {
    Navigation(){
      Column({space:15}) {
        TextInput({ text: this.name, placeholder: "姓名" })
        TextInput({ text: this.email, placeholder: "邮箱" })
        DatePickerView({text:"生日",selectedDate:this.selectedDate})
        RadioView({text:"性别",valueOne:"男孩",valueTwo:"女孩",group:"性别"})
        ToggleView({text:"通知",type:ToggleType.Switch,isOn:this.isOn})
        TextArea({text:this.markText,placeholder:"备注"}).height(200)
        Blank()
        Button('立即保存').width(140)
          .onClick(() => {
            promptAction.showToast({ message: '保存成功', duration: 2000 })
          })
      }
      .width('90%')
      .height('100%')
    }
    .title('MyForm')
  }
}

@Component
struct ToggleView{
  @Prop text: string
  @Prop type: ToggleType
  @Link isOn: boolean

  build() {
    Row(){
      Text(this.text)
      Blank()
      Toggle({ type: this.type, isOn: this.isOn })
    }
    .padding({left:20,right:8})
    .height(48)
    .width('100%')
    .backgroundColor(0xF5F5F5)
    .borderRadius(60)
  }
}

@Component
struct RadioView{
  @Prop text: string
  @Prop valueOne:string
  @Prop valueTwo:string
  @Prop group:string

  build() {
    Row(){
      Text(this.text)
      Blank()
      Row({space:10}) {
        Radio({ value: this.valueOne, group: this.group }).checked(true)
        Text(this.valueOne)
        Radio({ value: this.valueTwo, group: this.group }).checked(false)
        Text(this.valueTwo)
      }
    }
    .padding({left:20,right:8})
    .height(48)
    .width('100%')
    .backgroundColor(0xF5F5F5)
    .borderRadius(60)
  }
}

@Component
struct DatePickerView{
  @Prop text:string
  @Link selectedDate: Date

  dialogController: CustomDialogController = new CustomDialogController({
    builder: SelectedDatePickerView({selectedDate:this.selectedDate}),
    alignment: DialogAlignment.Bottom
  })

  build() {
    Row(){
      Text(this.text)
      Blank()
      Button(this.formatDate(this.selectedDate))
        .fontColor(0x333333)
        .backgroundColor(0xE5E5E5)
        .onClick(() => {
          this.dialogController.open()
        })
    }
    .padding({left:20,right:8})
    .height(48)
    .width('100%')
    .backgroundColor(0xF5F5F5)
    .borderRadius(60)
  }
  formatDate(date: Date): string {
    const dateString = new Intl.DateTimeFormat('zh-CN', {
      year: 'numeric',
      month: '2-digit',
      day: '2-digit',
    }).format(date)
    return dateString
  }
}

@CustomDialog
struct SelectedDatePickerView {
  controller?: CustomDialogController
  @Link selectedDate:Date

  build() {
    Column() {
      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate
      })
        .onDateChange((value: Date) => {
          this.selectedDate = value
        })
    }
    .width('90%')
    .height('35%')
    .margin(20)
  }
}

