//
//  TestData.swift
//  UICollectionSample
//
//  Created by hiraoka on 2020/07/21.
//  Copyright © 2020 hiraoka. All rights reserved.
//

import Foundation

let testData: [Question] = try! JSONDecoder().decode([Question].self, from: json.data(using: .utf8)!)

let json: String = """
[
    {
        "title": "質問1",
        "description": null,
        "type": "multi_selection",
        "required": true,
        "order": 0,
        "options": {
            "selections": [
                {
                    "title": "タイトル1",
                    "description": null,
                    "order": 0,
                },
                {
                    "title": "タイトル2",
                    "description": null,
                    "order": 0,
                },
                {
                    "title": "タイトル3",
                    "description": null,
                    "order": 0,
                },
                {
                    "title": "タイトル4",
                    "description": null,
                    "order": 0,
                },
                {
                    "title": "タイトル5",
                    "description": "説明",
                    "order": 0,
                },
                {
                    "title": "タイトル6",
                    "description": null,
                    "order": 0,
                },
                {
                    "title": "その他",
                    "description": null,
                    "order": 0,
                },
            ]
        }
    },
    {
        "title": "質問2",
        "description": null,
        "type": "single_selection",
        "required": false,
        "order": 0,
        "options": {
            "selections": [
                {
                    "title": "タイトル1",
                    "description": null,
                    "order": 0,
                },
                {
                    "title": "タイトル2",
                    "description": null,
                    "order": 0,
                },
                {
                    "title": "タイトル3",
                    "description": null,
                    "order": 0,
                }
            ]
        }
    },
    {
        "title": "質問3",
        "description": "",
        "type": "text",
        "required": false,
        "order": 0,
        "options": null
    }
]
"""
