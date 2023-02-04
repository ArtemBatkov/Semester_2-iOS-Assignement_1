//
//  ViewController.swift
//  Assignement_1
//
//  Created by user233573 on 2/1/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var onAnimeButtonClick: UIButton!
    
    @IBOutlet weak var onUkraineNewsClick: UIButton!
    
    
    @IBOutlet weak var onCatImageButtonClick: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func onAnimeClick(_ sender: Any) {
        let url = "https://api.waifu.pics/sfw/shinobu"
        Task{
            let data: Data = try await WebClientService.fetchData(from: url)
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                ShowApiOutput(api: "Anime Pics", json: json)
            }catch{
                print(error)
            }
        }
    }
    
    
    @IBAction func onUkraineClick(_ sender: Any) {
        let url = "https://newsapi.org/v2/top-headlines?country=ua&apiKey=b8af8e66db6a4e9297f144bd4c12210a"
        Task{
            let data: Data = try await WebClientService.fetchData(from: url)
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                ShowApiOutput(api: "Ukraine News", json: json)
            }catch{
                print(error)
            }
        }
    }
    
    
    
    @IBAction func onCatClick(_ sender: Any) {
        let url = "https://api.thecatapi.com/v1/images/search"
        Task{
            let data: Data = try await WebClientService.fetchData(from: url)
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                ShowApiOutput(api: "CatImage", json: json)
            }catch{
                print(error)
            }
            
        }
    }
    

    private func ShowApiOutput(api name: String, json: Any){
        print("\n\n--------------------------")
        print("\t\t\t\(name) API:")
        print(json)
        print("--------------------------")
    }
    
    
    
    
    
}

