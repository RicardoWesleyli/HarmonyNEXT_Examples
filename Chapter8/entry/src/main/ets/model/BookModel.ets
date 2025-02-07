// BookModel.ets
export class BookDataModel{
  id: number
  name: string
  author: string
  imageLink:string
  recommendation: string

  constructor(id:number,name:string,author:string,imageLink:string,recommendation:string) {
    this.id = id
    this.name = name
    this.author = author
    this.imageLink = imageLink
    this.recommendation = recommendation
  }
}

export class BookModel{
  code:number
  data:BookDataModel[]

  constructor(code:number,data:BookDataModel[]) {
    this.code = code
    this.data = data
  }
}