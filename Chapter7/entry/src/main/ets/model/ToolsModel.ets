// ToolsModel.ets
export class ToolsModel {
  id: number
  name: string
  image: string
  url: string
  description: string

  constructor(id:number,name:string,image: string,url:string,description:string) {
    this.id = id
    this.name = name
    this.image = image
    this.url = url
    this.description = description
  }
}

// 测试数据
export class MackData {
  static getTools(){
    return [
      new ToolsModel(
        1,
        'AppGallery',
        'appGallery_connect.png',
        'https://developer.huawei.com/consumer/cn/agconnect/',
        'AppGallery Connect 致力于为开发者提供创意、开发、分发、运营、分析的全生命周期服务，可以提升开发、运营效率，帮助开发者实现用户及收入的规模增长。'
      ),
      new ToolsModel(
        2,
        'DevEco Studio',
        'devEco_studio.png',
        'https://developer.huawei.com/consumer/cn/deveco-studio/',
        '一站式的 HarmonyOS 应用及元服务开发平台，为你提供代码开发、编译构建及调测等功能。'
      ),
      new ToolsModel(
        3,
        'DevEco Testing',
        'devEco_testing.png',
        'https://developer.huawei.com/consumer/cn/deveco-testing/',
        'DevEco Testing 是一站式的应用测试服务平台。为你提供自动化测试框架，及稳定性、性能等专项测试服务，覆盖应用测试全周期，助力打造高品质应用。'
      ),
      new ToolsModel(
        4,
        'Design System',
        'harmonyOS_design.png',
        'https://developer.huawei.com/consumer/cn/design/resource/',
        'HarmonyOS Symbol 系统图标设计是一次重要的演进。它不仅具备了字体属性，可以与系统字体无缝对接，而且超越了传统的静态图标功能，集成了多层颜色模式和分层动态效果。'
      ),
      new ToolsModel(
        5,
        'ArkTS',
        'arkts.png',
        'https://developer.huawei.com/consumer/cn/arkts/',
        'ArkTS 是鸿蒙原生应用的开发语言。它在保持 TypeScript（简称TS）基本语法风格的基础上，通过规范强化静态检查和分析，提升代码健壮性，让你轻松上手。'
      ),
      new ToolsModel(
        6,
        'ArkUI',
        'arkui.png',
        'https://developer.huawei.com/consumer/cn/arkui/',
        'ArkUI 是一套构建分布式应用界面的声明式 UI 开发框架。它使用简洁的 UI 信息语法、丰富的 UI 组件、实时界面预览工具，提升应用界面开发效率30%。'
      ),
      new ToolsModel(
        7,
        'ArkCompiler',
        'ark_compiler.png',
        'https://developer.huawei.com/consumer/cn/arkcompiler/',
        'ArkCompiler 是华为自研的统一编程平台，包含编译器、工具链、运行时等关键部件，支持高级语言在多种芯片平台的编译与运行。'
      ),
      new ToolsModel(
        8,
        'DevDoc',
        'devDoc.png',
        'https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/application-dev-guide-V5',
        '应用开发文档用于指导开发者通过HarmonyOS SDK提供的开放能力完成应用开发。'
      ),
      new ToolsModel(
        9,
        'Download',
        'download.png',
        'https://developer.huawei.com/consumer/cn/download/',
        '提供最新版本的开发工具下载，快速构建HarmonyOS应用/元服务。'
      ),
      new ToolsModel(
        10,
        'Sample',
        'sample.png',
        'https://developer.huawei.com/consumer/cn/samples/',
        '通过手把手的教学实践案例，从零基础开始，带你快速完成HarmonyOS 原生应用的开发，掌握应用开发的基础技能。'
      ),
    ]
  }
}
