//
//  HomeViewModel.swift
//  Danamon-App
//
//  Created by Ricky Gideon Iskandar Daun on 15/02/22.
//

import Foundation
import Alamofire

public class HomeViewModel {
    
    struct Photo {
        var title : String
        var id  : Int
        var url : String
        var thumbnailUrl : String
    }
    
    init(){
        if UserDefaults.standard.string(forKey: "user-role") == "User"{
            appendData(index: 0)
        }else{
            
        }
        
    }
    
    //trial with append
    var photo = Box([Photo]())

    //trial with infinite loop
    func appendData(index : Int){
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
        let startIndex = index * 50
        let endingIndex = (index + 1) * 50
        
        
        AF.request(url).responseDecodable(of: [PhotoElement].self) { response in

            if response.error != nil{
                print("something is wrong")
            }else{
                
                if let y = response.value{
                    if y.count > (startIndex + 1) && y.count > (endingIndex + 1 ){
                        for i in startIndex..<endingIndex {
                            self.photo.value.append(Photo(title: y[i].title, id: y[i].id, url: y[i].url, thumbnailUrl: y[i].thumbnailUrl))
                        }
                    }
                }
            }
        }
    }
    
    
    
    
    //    var photo =  Box([PhotoElement]())
    
    
    
    //    func fetchData(){
    //
    //        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
    //
    //        AF.request(url).responseDecodable(of: [PhotoElement].self) { response in
    //
    //            if response.error != nil{
    //                print("something is wrong")
    //            }else{
    //
    //
    //                if let y = response.value{
    //
    //                    self.photo.value = y
    //                }
    //            }
    //        }
    //
    //    }
    
    
}
