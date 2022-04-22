//
//  WUISimpleTextFormCell.swift
//  wbea
//
//  Created by Hyubyn on 19/04/2022.
//

import UIKit
import WebKit

final class WUISimpleTextFormCell: WUIBaseTableCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    
    override func setupLayout() {
        super.setupLayout()
        webView.navigationDelegate = self
        webView.scrollView.showsHorizontalScrollIndicator = false
        webView.scrollView.showsVerticalScrollIndicator = false
    }
    
    override func update() {
        super.update()
        guard let field = field as? WUISimpleTextFormField else { return }
        titleLabel.textAlignment = field.textAlignment
        titleLabel.textColor = field.textColor
        titleLabel.font = field.font
        if let backgroundColor = field.backgroundColor {
            self.backgroundColor = backgroundColor
        }
        if let height = field.height {
            self.titleLabel.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if field.isWebBasedContent {
            titleLabel.text = field.text
            if let text = field.text {
                titleLabel.isHidden = true
                webView.loadHTMLString(text.htmlWrappedString, baseURL: Bundle.main.bundleURL)
                webView.isHidden = false
            }
        } else {
            titleLabel.isHidden = false
            webView.isHidden = true
            if let attributedText = field.attributedText {
                titleLabel.attributedText = attributedText
            } else {
                titleLabel.text = field.text
            }
        }
    }
}

// MARK: - WKNavigationDelegate
extension WUISimpleTextFormCell: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == .linkActivated {
            if let url = navigationAction.request.url, UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
                decisionHandler(.cancel)
            } else {
                decisionHandler(.cancel)
            }
        } else {
            decisionHandler(.allow)
        }
    }
}
