//
//  ViewController.swift
//  wbea
//
//  Created by Hyubyn on 13/04/2022.
//

import UIKit

class TestFormViewController: WUIFormViewController {
    let objects: [WMAirQuality] = [
        .makeMockObject(status: .notAnExceedance),
        .makeMockObject(status: .confirmed),
        .makeMockObject(status: .detected),
        .makeMockObject(status: .validated)
    ]

    private lazy var headerSegmentedControl: WUISegmentedControl = {
        let field = WUISegmentedControl.instantiate()
        field.frame = CGRect(x: 0, y: 0, width: view.bounds.width - 32, height: 30)
        field.onSelectedIndex = {[weak self] index in
            print("Selected item at index: \(index)")
            self?.reloadFields()
        }
        field.buttonTitles = ["AAAQO", "AAAQG", "FMKRT"]
        return field
    }()

    override func setupFields() {
        var tempFields: [WUIBaseFormField] = []
        tempFields.append(contentsOf: objects.map { object -> WUICardViewFormField in
            let field = WUICardViewFormField()
            field.airQualityModel = object
            return field
        })
        fields = tempFields
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.titleView = headerSegmentedControl
    }

}

