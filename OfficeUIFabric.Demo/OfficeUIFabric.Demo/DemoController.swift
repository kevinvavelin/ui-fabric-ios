//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import OfficeUIFabric
import UIKit

class DemoController: UIViewController {
    static let margin: CGFloat = 16
    static let horizontalSpacing: CGFloat = 40
    static let verticalSpacing: CGFloat = 16
    static let rowTextWidth: CGFloat = 75

    class func createVerticalContainer() -> UIStackView {
        let container = UIStackView(frame: .zero)
        container.axis = .vertical
        container.layoutMargins = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        container.isLayoutMarginsRelativeArrangement = true
        container.spacing = verticalSpacing
        return container
    }

    let container: UIStackView = createVerticalContainer()
    let scrollingContainer = UIScrollView(frame: .zero)

    func createButton(title: String, action: Selector) -> MSButton {
        let button = MSButton()
        button.titleLabel?.lineBreakMode = .byTruncatingTail
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }

    func addTitle(text: String) {
        let titleLabel = MSLabel(style: .headline)
        titleLabel.text = text
        titleLabel.textAlignment = .center
        container.addArrangedSubview(titleLabel)
    }

    func addRow(text: String = "", items: [UIView], itemSpacing: CGFloat = horizontalSpacing, stretchItems: Bool = false) {
        let itemsContainer = UIStackView()
        itemsContainer.axis = .vertical
        itemsContainer.alignment = stretchItems ? .fill : .leading

        let itemRow = UIStackView()
        itemRow.axis = .horizontal
        itemRow.distribution = stretchItems ? .fillEqually : .fill
        itemRow.alignment = .center
        itemRow.spacing = itemSpacing

        if text != "" {
            let label = MSLabel(style: .subhead, colorStyle: .regular)
            label.text = text
            label.widthAnchor.constraint(equalToConstant: DemoController.rowTextWidth).isActive = true
            itemRow.addArrangedSubview(label)
        }

        items.forEach { itemRow.addArrangedSubview($0) }
        itemsContainer.addArrangedSubview(itemRow)
        container.addArrangedSubview(itemsContainer)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = MSColors.background1

        view.addSubview(scrollingContainer)
        scrollingContainer.fitIntoSuperview()
        scrollingContainer.addSubview(container)
        // UIScrollView in RTL mode still have leading on the left side, so we cannot rely on leading/trailing-based constraints
        container.fitIntoSuperview(usingConstraints: true, usingLeadingTrailing: false, autoHeight: true)
    }
}
