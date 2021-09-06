//
//  FormTableViewCell.swift
//  InstaMeAppNextGen
//
//  Created by Anton Veldanov on 9/5/21.
//

import UIKit
// Return value to view controller
// AnyObject - any Instance
protocol FormTableViewDelegate: AnyObject {
    func formTableViewCell(_ cell: FormTableViewCell, didUpdateTextField updatedModel: EditProfileFormModel)
}


class FormTableViewCell: UITableViewCell, UITextFieldDelegate {

    static let identifier = "FormTableViewCell"

    public weak var delegate: FormTableViewDelegate?
    
    private var model: EditProfileFormModel?
    
    private let formLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.returnKeyType = .done
        return textField
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        clipsToBounds = true
        contentView.addSubview(formLabel)
        contentView.addSubview(textField)
        textField.delegate = self
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureCell(with model: EditProfileFormModel){
        self.model = model
        formLabel.text = model.label
        textField.placeholder = model.placeholder
        textField.text = model.value
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        formLabel.text = nil
        textField.placeholder = nil
        textField.text = nil
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Assign Frames
        
        formLabel.frame = CGRect(x: 5,
                                 y: 0,
                                 width: contentView.width/3,
                                 height: contentView.height)
        textField.frame = CGRect(x: formLabel.right+5,
                                 y: 0,
                                 width: contentView.width-10-formLabel.width,
                                 height: contentView.height)
    }
    
    
     //MARK: textField
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        model?.value = textField.text
        guard  let model = model else {
            return true
        }
        
        delegate?.formTableViewCell(self, didUpdateTextField: model)
        
        textField.resignFirstResponder()//get rids of keyboard on Enter
        return true
    }
    
    
}
