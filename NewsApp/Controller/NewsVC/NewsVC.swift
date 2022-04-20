//
//  NewsVC.swift
//  NewsApp
//
//  Created by Utku on 19.04.2022.
//

import UIKit
import Alamofire
import Kingfisher
class NewsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var news: News?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
        fetchAllDatas()
    }
    func fetchAllDatas() {
        AF.request("https://api.spaceflightnewsapi.net/v3/articles").responseDecodable(of: News.self) { (model) in
            
            self.news = model.value
            self.tableView.reloadData()
        }
    }
}

extension NewsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        cell.setCell(news: news?[indexPath.row])
        return cell
    }
}
