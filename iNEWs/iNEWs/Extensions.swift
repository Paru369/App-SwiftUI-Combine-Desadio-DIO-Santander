//
//  Extensions.swift
//  iNEWs
//
//  Created by Paulo Pinheiro on 9/6/23.
//

import Foundation


extension Article {
    static var dummyData: Article {
        .init (
        author: "Joseph Wulfsohn",
        url: "https://www.foxnews.com/media/new-york-magazine-jonathan-chait-gina-carano-disney-hollywood-blacklist",
        source: "Fox News",
        title: "Disney's Gina Carano firing denounced as 'Hollywood Blacklist' against conservatives - Fox News",
        articleDescription: "Conservative actress Gina Carano found rare support among liberals in the mainstream media following her firing from The Mandalorian over social media posts and being dropped by her agency UTA.",
        image: "https://www.reuters.com/resizer/5c1f2tu36LVmk8t4TMOAMvLasxY=/1200x628/smart/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/ZO2TST2SFBIXRI7CA7KFKOUIUI.jpg",
        date: Date ())
    }
}
