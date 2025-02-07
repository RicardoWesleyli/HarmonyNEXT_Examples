export class TitleBarAttribute {
  backBtnShow: boolean;
  backBtnIcon: Resource;
  backBtnText: string;
  backBtnCallback: () => void;
  title: string;
  menuBtnShow: boolean;
  menuBtnIcon: Resource;
  menuBtnText: string;
  menuBtnCallback: () => void;

  constructor(
    backBtnShow: boolean,
    backBtnIcon: Resource,
    backBtnText: string,
    backBtnCallback: () => void,
    title: string,
    menuBtnShow: boolean,
    menuBtnIcon: Resource,
    menuBtnText: string,
    menuBtnCallback: () => void
  ) {
    this.backBtnShow = backBtnShow;
    this.backBtnIcon = backBtnIcon;
    this.backBtnText = backBtnText;
    this.backBtnCallback = backBtnCallback;
    this.title = title;
    this.menuBtnShow = menuBtnShow;
    this.menuBtnIcon = menuBtnIcon;
    this.menuBtnText = menuBtnText;
    this.menuBtnCallback = menuBtnCallback;
  }
}

@Component
export struct TitleView {
  @Link titleBarAttribute: TitleBarAttribute

  build() {
    Stack() {
      Row() {
        if (this.titleBarAttribute.backBtnShow) { this.leftBtn() }
        Blank()
        if (this.titleBarAttribute.menuBtnShow) { this.rightBtn() }
      }
      .width('90%')

      this.titleText()
    }
  }
  @Builder
  leftBtn(){
    Button({ type: ButtonType.Capsule, stateEffect: true }) {
      Row({ space: 5 }) {
        SymbolGlyph(this.titleBarAttribute.backBtnIcon).fontSize(14)
        Text(this.titleBarAttribute.backBtnText).fontSize(14)
      }.margin(10)
    }
    .backgroundColor(0xF5F5F5)
    .onClick(() => {
      this.titleBarAttribute.backBtnCallback()
    })
  }
  @Builder
  titleText(){
    Text(this.titleBarAttribute.title)
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
  }
  @Builder
  rightBtn(){
    Button({ type: ButtonType.Capsule, stateEffect: true }) {
      Row({ space: 5 }) {
        SymbolGlyph(this.titleBarAttribute.menuBtnIcon).fontSize(14)
        Text(this.titleBarAttribute.menuBtnText).fontSize(14)
      }.margin(10)
    }
    .backgroundColor(0xF5F5F5)
    .onClick(() => {
      this.titleBarAttribute.menuBtnCallback()
    })
  }
}