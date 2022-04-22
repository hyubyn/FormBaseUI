//
//  WUISegmentedControl.swift
//  wbea
//
//  Created by Hyubyn on 21/04/2022.
//

import UIKit

final class WUISegmentedControl: UIView, WUINibLoadable {
    override var intrinsicContentSize: CGSize {
        return UIView.layoutFittingExpandedSize
    }
    @IBOutlet private var segmentedControl: UIView!
    @IBOutlet private var buttonsStackView: UIStackView!
    private var buttons = [UIButton]()
    private var observer: NSKeyValueObservation?
    private var separators = [UIView]()
    var onSelectedIndex: ((Int) -> Void)?
    var selectedFont: UIFont = WUITheme.WUIFont.sectionTitle
    var defaultFont: UIFont = WUITheme.WUIFont.sectionTitle
    var buttonTitles = [String]()
    var selectedButtonIndex = 0

    private lazy var selectionIndicator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = WUITheme.WUIColor.green
        view.cornerRadius = 10
        view.defaultShadow = true
        return view
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        segmentedControl.insertSubview(selectionIndicator, belowSubview: buttonsStackView)
        NSLayoutConstraint.activate([
            selectionIndicator.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            selectionIndicator.heightAnchor.constraint(equalTo: heightAnchor, constant: -4),
            selectionIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        segmentedControl.cornerRadius = 10
        segmentedControl.backgroundColor = WUITheme.WUIColor.lightGrey
        observer = observe(\.bounds, options: [.old, .new], changeHandler: { [weak self] _, change in
            if change.oldValue != change.newValue {
                self?.setupView()
            }
        })
    }

    private func setupView() {
        populateButtons()
        generateSeparator()
        animatingUpdateSelectedIndex(selectedIndex: self.selectedButtonIndex, completion: nil)
    }

    private func generateSeparator() {
        let buttonWidth = frame.width / CGFloat(buttons.count)
        for subview in separators {
            subview.removeFromSuperview()
        }
        separators.removeAll()
        if buttons.count > 1 {
            for index in 0..<buttons.count - 1 {
                let view = UIView(frame: CGRect(x: CGFloat(index + 1) * buttonWidth - 1, y: 8, width: 1, height: frame.height - 16))
                view.backgroundColor = WUITheme.WUIColor.grey
                separators.append(view)
            }
            for subview in separators {
                segmentedControl.insertSubview(subview, at: 0)
            }
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        animatingUpdateSelectedIndex(selectedIndex: selectedButtonIndex, completion: nil)
    }

    private func populateButtons() {
        for subview in buttonsStackView.arrangedSubviews {
            subview.removeFromSuperview()
        }
        buttons.removeAll()
        buttons = buttonTitles.map { title -> UIButton in
            let buttonIndex = buttonTitles.firstIndex(of: title) ?? -1
            let isButtonSelected = buttonIndex == selectedButtonIndex
            let button = UIButton()
            button.tag = buttonIndex
            button.titleLabel?.font = isButtonSelected ? selectedFont : defaultFont
            button.setTitle(title, for: .normal)
            button.setTitleColor(isButtonSelected ? .white : .black, for: .normal)
            button.addTarget(self, action: #selector(WUISegmentedControl.onButtonTapped(_:)), for: .touchUpInside)
            button.cornerRadius = 10
            return button
        }
        for button in buttons {
            buttonsStackView.addArrangedSubview(button)
        }
    }

    private func animatingUpdateSelectedIndex(selectedIndex: Int, completion: (() -> Void)?) {
        UIView.animate(withDuration: 0.15, delay: 0, options: .showHideTransitionViews) {
            for button in self.buttons {
                button.setTitleColor(button.tag == selectedIndex ? .white : .black, for: .normal)
                if button.tag == selectedIndex {
                    if button.tag == 0 {
                        self.selectionIndicator.center = CGPoint(x: self.selectionIndicator.frame.width / 2 + 2, y: self.frame.height / 2)
                    } else if button.tag == self.buttons.count - 1 {
                        self.selectionIndicator.center = CGPoint(x: self.frame.width - self.selectionIndicator.frame.width / 2 - 2, y: self.frame.height / 2)
                    } else {
                        self.selectionIndicator.center = button.center
                    }
                }
            }
        } completion: { finished in
            if finished {
                completion?()
            }
        }
    }

    @objc private func onButtonTapped(_ sender: UIButton) {
        animatingUpdateSelectedIndex(selectedIndex: sender.tag) {
            self.selectedButtonIndex = sender.tag
            self.onSelectedIndex?(sender.tag)
        }
    }
}
