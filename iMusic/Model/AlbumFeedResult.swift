//
//	AlbumFeedResult.swift
//  iMusic
//
//  Created by Ranjith on 12/12/17.
//  Copyright © 2017 Ranjith. All rights reserved.
//

import Foundation

struct AlbumFeedResult{

	var feed : Feed!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let feedData = dictionary["feed"] as? [String:Any]{
				feed = Feed(fromDictionary: feedData)
			}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if feed != nil{
			dictionary["feed"] = feed.toDictionary()
		}
		return dictionary
	}

}
