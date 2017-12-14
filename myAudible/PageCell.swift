//
//  PageCell.swift
//  myAudible
//
//  Created by Mani Nomula on 12/3/17.
//  Copyright © 2017 Mani Nomula. All rights reserved.
//

import UIKit

class PageCell :UICollectionViewCell{
    
    var page:Page?{
        didSet{
            guard let page = page else
            {return}
            var imageName = page.imageName
            if UIDevice.current.orientation.isLandscape{
                imageName += "_landscape"
            }
            imageView.image = UIImage(named:page.imageName)
            let color = UIColor(white: 0.2, alpha: 1)
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 20,weight:UIFontWeightMedium),NSForegroundColorAttributeName:color])
            
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 16),NSForegroundColorAttributeName:color]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let length = attributedText.string.characters.count
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0, length: length))
            
            textView.attributedText = attributedText
        }
    }
    
    let imageView:UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .yellow
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named:"page1")
        iv.clipsToBounds = true
        return iv
    }()
    
    let textView:UITextView = {
        let tv = UITextView()
        tv.text = "Hello"
        tv.isEditable = false
        tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        return tv
    }()
    
    let lineSparatatorView:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return line
    }()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUpViews(){
        
        addSubview(imageView)
        addSubview(textView)
        addSubview(lineSparatatorView)
        
        imageView.anchorToTop(topAnchor,left:leftAnchor,bottom: textView.topAnchor,right: rightAnchor)
 
        textView.anchorWithConstantsToTop(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        lineSparatatorView.anchorToTop(nil, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        lineSparatatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}
