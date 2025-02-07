// NetworkManager.ets
import { http } from '@kit.NetworkKit'

export class NetworkManager {
  // 发起网络请求
  static async httpRequest<T>(url: string, method: http.RequestMethod, responseCode: number): Promise<T> {
    // 建立Http请求
    const httpRequest = http.createHttp();

    // 设置可选参数
    const options: http.HttpRequestOptions = {
      method: method,
      header: { 'Content-Type': 'application/json' },
      readTimeout: 15000,
      connectTimeout: 15000,
    };

    // 返回数据结果
    try {
      // 处理网络请求
      const response = await NetworkManager.sendRequest(httpRequest, url, options);

      // 处理HTTP响应
      NetworkManager.validateResponseCode(response, responseCode);
      return NetworkManager.parseResponse<T>(response);

    } catch (error) {
      // 处理异常
      console.error('Network request failed:', error);
      throw error instanceof Error ? error : new Error(error);
    }
  }

  // 发送HTTP请求并返回响应结果
  private static async sendRequest(httpRequest: http.HttpRequest, url: string, options: http.HttpRequestOptions): Promise<http.HttpResponse> {
    return new Promise<http.HttpResponse>((resolve, reject) => {
      httpRequest.request(url, options, (error, data) => {
        if (error) {
          console.log("error code: " + error.code + ", msg: " + error.message);
          reject(error);
        } else {
          resolve(data);
        }
        httpRequest.destroy();
      });
    });
  }

  // 验证HTTP响应状态码是否符合预期
  private static validateResponseCode(response: http.HttpResponse, expectedCode: number): void {
    if (response.responseCode !== expectedCode) {
      throw new Error(`Server responded with status code: ${response.responseCode}`);
    }
  }

  // 解析HTTP响应结果为泛型类型T
  private static parseResponse<T>(response: http.HttpResponse): T {
    if (typeof response.result === 'string') {
      try {
        return JSON.parse(response.result) as T;
      } catch (parseError) {
        throw new Error(`Failed to parse JSON: ${parseError.message}`);
      }
    } else {
      throw new Error('Response result is not a string');
    }
  }
}
