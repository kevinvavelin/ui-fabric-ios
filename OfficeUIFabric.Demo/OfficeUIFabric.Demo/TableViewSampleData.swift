//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation
import OfficeUIFabric

class TableViewSampleData {
    struct Section {
        let title: String
        var item: Item { return items[0] }
        let items: [Item]
        let numberOfLines: Int
        let hasAccessoryView: Bool
        let allowsMultipleSelection: Bool
        let headerStyle: MSTableViewHeaderFooterView.Style
        let hasFooter: Bool
        let footerText: String

        init(title: String, items: [Item] = [], numberOfLines: Int = 1, hasAccessoryView: Bool = false, allowsMultipleSelection: Bool = true, headerStyle: MSTableViewHeaderFooterView.Style = .header, hasFooter: Bool = false, footerText: String = "") {
            self.title = title
            self.items = items
            self.numberOfLines = numberOfLines
            self.hasAccessoryView = hasAccessoryView
            self.allowsMultipleSelection = allowsMultipleSelection
            self.headerStyle = headerStyle
            self.hasFooter = hasFooter
            self.footerText = footerText
        }
    }

    struct Item {
        let text1: String
        let text2: String
        let text3: String
        let image: String

        init(text1: String = "", text2: String = "", text3: String = "", image: String = "") {
            self.text1 = text1
            self.text2 = text2
            self.text3 = text3
            self.image = image
        }
    }

    static func createCustomView(imageName: String) -> UIImageView? {
        if imageName == "" {
            return nil
        }

        let customView = UIImageView(image: UIImage(named: imageName))
        customView.contentMode = .scaleAspectFit
        return customView
    }
}
