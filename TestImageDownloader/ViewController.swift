//
//  ViewController.swift
//  TestImageDownloader
//
//  Created by 周文刚 on 2018/10/11.
//  Copyright © 2018年 周文刚. All rights reserved.
//

import UIKit
import Kingfisher
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let str2 = "http://116.196.86.198/116576576224622399.png"
        
        ImageDownloader.default.delegate = GGImageDownloader.shared
        let str1 = "http://hangge.com/blog/images/logo.png"
        
        let url = URL(string: str1)
        ImageDownloader.default.downloadImage(with: url!, retrieveImageTask: nil, options: nil, progressBlock: nil, completionHandler: nil)
    }
}

class GGImageDownloader: ImageDownloaderDelegate {
    static let shared = GGImageDownloader()
    func imageDownloader(_ downloader: ImageDownloader, willDownloadImageForURL url: URL, with request: URLRequest?) {
        print("1 - 开始下载图片")
    }
    
    func imageDownloader(_ downloader: ImageDownloader, didFinishDownloadingImageForURL url: URL, with response: URLResponse?, error: Error?) {
        print("2 - 图片下载完成，开始处理图片")
    }
    func imageDownloader(_ downloader: ImageDownloader, didDownload data: Data, for url: URL) -> Data? {
        print("3 - 以二进制表示的图片")
        print(data) // 例如 1912 bytes
        return data
    }
    // 如果我们只需要结果，那么我们只实现最后一个协议就可以
    func imageDownloader(_ downloader: ImageDownloader, didDownload image: Image, for url: URL, with response: URLResponse?) {
        print("4 - 最终的图片")
        print(image) // 例如 <UIImage: 0x6000030064c0>, {260, 55}
    }
    
}
