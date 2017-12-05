//
//  HideShowPasswordTextField.swift
//  Guidebook
//
//  Created by Mike Sprague on 4/15/16.
//
//

import Foundation
import UIKit

protocol HideShowPasswordTextFieldDelegate: class {
    func isValidPassword(password: String) -> Bool
}

class HideShowPasswordTextField: UITextField {
    weak var passwordDelegate: HideShowPasswordTextFieldDelegate?
    var preferredFont: UIFont? {
        didSet {
            self.font = preferredFont
            
            if self.isSecureTextEntry {
                self.font = nil
            }
        }
    }
    
    override var isSecureTextEntry: Bool {
        didSet {
            if !isSecureTextEntry {
                self.font = nil
                self.font = preferredFont
            }
        }
    }
    private var passwordToggleVisibilityView: PasswordToggleVisibilityView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    
    @IBInspectable dynamic open var borderInactiveColor: UIColor? {
        didSet {
            setBottomBorder()
        }
    }
    
    func setBottomBorder()
    {
        borderStyle = UITextBorderStyle.none;
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = borderInactiveColor?.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width,   width:  self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    // image start 5 pixel right
    @IBInspectable var leftPadding: CGFloat = 5
    
    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextFieldViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = UITextFieldViewMode.never
            leftView = nil
        }
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: color])
    }
    
}


// MARK: UITextFieldDelegate needed calls
// Implement UITextFieldDelegate when you use this, and forward these calls to this class!
extension HideShowPasswordTextField {
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        // Hack to prevent text from getting cleared
        // http://stackoverflow.com/a/29195723/1417922
        //Setting the new text.
        let updatedString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        textField.text = updatedString
        
        //Setting the cursor at the right place
        let selectedRange = NSMakeRange(range.location + string.characters.count, 0)
        let from = textField.position(from: textField.beginningOfDocument, offset: selectedRange.location)!
        let to = textField.position(from: from, offset: selectedRange.length)!
        textField.selectedTextRange = textField.textRange(from: from, to: to)
        
        //Sending an action
        textField.sendActions(for: .editingChanged)
        
        return false
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        passwordToggleVisibilityView.eyeState = PasswordToggleVisibilityView.EyeState.Closed
        self.isSecureTextEntry = !isSelected
    }
}

// MARK: PasswordToggleVisibilityDelegate
extension HideShowPasswordTextField: PasswordToggleVisibilityDelegate {
    func viewWasToggled(passwordToggleVisibilityView: PasswordToggleVisibilityView, isSelected selected: Bool) {
        
        // hack to fix a bug with padding when switching between secureTextEntry state
        let hackString = self.text
        self.text = " "
        self.text = hackString
        
        // hack to save our correct font.  The order here is VERY finicky
        self.isSecureTextEntry = !selected
    }
}

// MARK: Control events
extension HideShowPasswordTextField {
    @objc func passwordTextChanged(sender: AnyObject) {
        if let password = self.text {
            passwordToggleVisibilityView.checkmarkVisible = passwordDelegate?.isValidPassword(password: password) ?? false
        } else {
            passwordToggleVisibilityView.checkmarkVisible = false
        }
    }
}

// MARK: Private helpers
extension HideShowPasswordTextField {
    private func setupViews() {
        let toggleFrame = CGRect(x: 0, y: 0, width: 66, height: frame.height)
        passwordToggleVisibilityView = PasswordToggleVisibilityView(frame: toggleFrame)
        passwordToggleVisibilityView.delegate = self
        passwordToggleVisibilityView.checkmarkVisible = false
        
        self.keyboardType = .asciiCapable
        self.rightView = passwordToggleVisibilityView
        self.rightViewMode = .whileEditing
        
        self.font = self.preferredFont
        self.addTarget(self, action: #selector(HideShowPasswordTextField.passwordTextChanged(sender:)), for: .editingChanged)
        
        // if we don't do this, the eye flies in on textfield focus!
        self.rightView?.frame = self.rightViewRect(forBounds: self.bounds)
        
        // default eye state based on our initial secure text entry
        passwordToggleVisibilityView.eyeState = isSecureTextEntry ? .Closed : .Open
    }
}
