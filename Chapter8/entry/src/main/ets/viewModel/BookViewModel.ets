// BookViewModel.ets
import { BookDataModel, BookModel } from '../model/BookModel'
import { NetworkManager } from '../network/NetworkManager'
import { http } from '@kit.NetworkKit'

export class BookViewModel{
  url:string = 'https://api.npoint.io/d8bdf14300b11a4129ce'
  method: http.RequestMethod = http.RequestMethod.GET
  responseCode:number = 200
  bookData:BookDataModel[] = []

  // 请求数据方法
  async fetchBooks(){
    NetworkManager.httpRequest<BookModel>(
      this.url,
      this.method,
      this.responseCode
    )
      .then(books => {
        this.bookData = books.data
        console.log('Fetched books:', this.bookData)
      })
      .catch((error: Error) => {
        console.error(error.message)
      })
  }
}