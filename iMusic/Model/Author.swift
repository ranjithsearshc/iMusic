//
//	Author.swift
//  iMusic
//
//  Created by Ranjith on 12/12/17.
//  Copyright © 2017 Ranjith. All rights reserved.
//

import Foundation

struct Author{

	var name : String!
	var uri : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		name = dictionary["name"] as? String
		uri = dictionary["uri"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if name != nil{
			dictionary["name"] = name
		}
		if uri != nil{
			dictionary["uri"] = uri
		}
		return dictionary
	}

}
