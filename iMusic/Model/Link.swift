//
//	Link.swift
//  iMusic
//
//  Created by Ranjith on 12/12/17.
//  Copyright © 2017 Ranjith. All rights reserved.
//

import Foundation

struct Link{

	var alternate : String!
	var selff : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		alternate = dictionary["alternate"] as? String
		selff = dictionary["self"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if alternate != nil{
			dictionary["alternate"] = alternate
		}
		if selff != nil{
			dictionary["self"] = self
		}
		return dictionary
	}

}
