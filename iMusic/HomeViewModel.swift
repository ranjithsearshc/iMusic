//
//  HomeViewModel.swift
//  iMusic
//
//  Created by Ranjith on 12/12/17.
//  Copyright © 2017 Ranjith. All rights reserved.
//

import Foundation

let topAlbumRSSFeedURL = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/10/explicit.json"

class HomeViewModel {
    var albumFeed = [Album]()
    
    func fetchTopAlbums(completion: @escaping () -> Void) {
        guard let url = URL(string: topAlbumRSSFeedURL) else { return completion() }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] {
                let result = AlbumFeedResult(fromDictionary: jsonObj!)
                self.albumFeed = result.feed.results
                DispatchQueue.main.async {
                    completion()
                }

            }
        }
        task.resume()
    }
    
    func numberOfSectionsToDisplay() -> Int {
        return 1
    }
    
    func numberOfRowsToDisplay(in section: Int) -> Int {
        return albumFeed.count
    }
    
    func getAlbum(_ indexPath: IndexPath) -> Album {
        return albumFeed[indexPath.row]
    }
}
