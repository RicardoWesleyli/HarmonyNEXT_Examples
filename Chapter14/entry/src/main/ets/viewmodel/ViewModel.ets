import { NameData, NameModel } from "../model/NameModel";
import { NetworkManager } from "../network/NetworkManager";
import { http } from "@kit.NetworkKit";
import { promptAction } from "@kit.ArkUI";

@Observed
export class NameViewModel{
  url:string = 'https://api.npoint.io/bfdce1295cd90eebeb78'
  method: http.RequestMethod = http.RequestMethod.GET
  responseCode:number = 200
  nameList:NameModel[] = []

  async fetchData(){
    NetworkManager.httpRequest<NameData>(
      this.url,
      this.method,
      this.responseCode
    )
    .then(nameData => {
      this.nameList = nameData.data
      console.log('Fetched data:',this.nameList)
    })
    .catch((error: Error) => {
      console.error(error.message)
    })
  }

  addData(data:NameModel){
    this.nameList.push(data)
    this.nameList = [...this.nameList]
    console.log('Added data:', this.nameList)
  }

  showToast(message:string){
    promptAction.showToast({
      message:message,
      duration:2000,
      showMode: promptAction.ToastShowMode.DEFAULT,
      bottom:80
    })
  }
}