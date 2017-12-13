//
//	Genre.swift
//  iMusic
//
//  Created by Ranjith on 12/12/17.
//  Copyright © 2017 Ranjith. All rights reserved.
//

import Foundation

struct Genre{

	var genreId : String!
	var name : String!
	var url : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		genreId = dictionary["genreId"] as? String
		name = dictionary["name"] as? String
		url = dictionary["url"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if genreId != nil{
			dictionary["genreId"] = genreId
		}
		if name != nil{
			dictionary["name"] = name
		}
		if url != nil{
			dictionary["url"] = url
		}
		return dictionary
	}

}
