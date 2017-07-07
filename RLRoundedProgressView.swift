//
//  RoundedProgressView.swift
//  RoundedProgressBar
//
//  Created by Roni Leshes on 04/07/2017.
//  Copyright © 2017 Roni Leshes. All rights reserved.
//

import UIKit

@IBDesignable
class RLRoundedProgressView: UIView {


    //====================================
    //MARK: Properties
    //====================================
    private var progressBackgroundView : UIView?
    private var progressBarView : UIView?
    
    private var progressBarViewWidthConstraint : NSLayoutConstraint?
    
    //Colors
    @IBInspectable var progressBackgroundColor : UIColor = UIColor(white: 1.0, alpha: 0.5){
        didSet{
            self.progressBackgroundView?.backgroundColor = progressBackgroundColor
        }
    }
    @IBInspectable var progressBarColor : UIColor = .white{
        didSet{
            self.progressBarView?.backgroundColor = progressBarColor
        }
    }

    //Paddings
    @IBInspectable var verticalPadding : CGFloat = 8.0
    @IBInspectable var horizontalPadding : CGFloat = 8.0
    
    //Paddings
    @IBInspectable var progressPercent: CGFloat = 50.0
    
    //Direction
    @IBInspectable var isRTL: Bool = false
    
    //====================================
    //MARK: ============== Implementation ==============
    //====================================
    override func draw(_ rect: CGRect) {

        self.progressBackgroundView = self.makeProgressBarView(withColor: self.progressBackgroundColor)
        self.addSubview(self.progressBackgroundView!)
        self.progressBarView = self.makeProgressBarView(withColor: self.progressBarColor)
        self.addSubview(self.progressBarView!)
        
        self.setConstraints()
    }
    
    
    
    //====================================
    //MARK: Make views
    //====================================
    private func makeProgressBarView(withColor color:UIColor) -> UIView{
        
        //Get frame
        let progressViewWidth = self.frame.size.width - (self.horizontalPadding * 2)
        let progressViewHeight = self.frame.size.height - (self.verticalPadding * 2)
        
        //Make view
        let progressView = UIView(frame: CGRect(x: 0, y: 0, width: progressViewWidth, height: progressViewHeight))
        progressView.layer.masksToBounds = true
        progressView.layer.cornerRadius = progressViewHeight/2
        
        
        //Set color
        progressView.backgroundColor = color
        
        //Return
        return progressView
    }
    
    

    //====================================
    //MARK: Set constraints
    //====================================
    private func setConstraints(){
        
        
        //Background constraints
        self.progressBackgroundView!.translatesAutoresizingMaskIntoConstraints = false
        var topSpaceConstraint = NSLayoutConstraint(item: self.progressBackgroundView!,
                                                    attribute: .top, relatedBy: .equal,
                                                    toItem: self, attribute: .top,
                                                    multiplier: 1,
                                                    constant: self.verticalPadding)
        
        var bottomSpaceConstraint = NSLayoutConstraint(item: self.progressBackgroundView!,
                                                       attribute: .bottom,
                                                       relatedBy: .equal,
                                                       toItem: self, attribute: .bottom,
                                                       multiplier: 1,
                                                       constant: -self.verticalPadding)
        
        let leadingSpaceConstraint = NSLayoutConstraint(item: self.progressBackgroundView!,
                                                        attribute: .leading,
                                                        relatedBy: .equal,
                                                        toItem: self,
                                                        attribute: .leading,
                                                        multiplier: 1,
                                                        constant: self.horizontalPadding)
        
        let trailingSpaceConstraint = NSLayoutConstraint(item: self.progressBackgroundView!,
                                                         attribute: .trailing,
                                                         relatedBy: .equal,
                                                         toItem: self,
                                                         attribute: .trailing,
                                                         multiplier: 1,
                                                         constant: -self.horizontalPadding)
        
        self.addConstraints([topSpaceConstraint,
                             bottomSpaceConstraint,
                             leadingSpaceConstraint,
                             trailingSpaceConstraint])
        
        
        
        
        //Progress constraints
        self.progressBarView!.translatesAutoresizingMaskIntoConstraints = false
        topSpaceConstraint = NSLayoutConstraint(item: self.progressBarView!,
                                                attribute: .top,
                                                relatedBy: .equal,
                                                toItem: self,
                                                attribute: .top,
                                                multiplier: 1,
                                                constant: self.verticalPadding)
        
        bottomSpaceConstraint = NSLayoutConstraint(item: self.progressBarView!,
                                                   attribute: .bottom,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .bottom,
                                                   multiplier: 1,
                                                   constant: -self.verticalPadding)
        
        
        let leadingStickConstraint : NSLayoutConstraint //Stick to the trailing if RTL
        if self.isRTL{
            leadingStickConstraint = NSLayoutConstraint(item: self.progressBarView!,
                                                        attribute: .trailing,
                                                        relatedBy: .equal,
                                                        toItem: self.progressBackgroundView,
                                                        attribute: .trailing,
                                                        multiplier: 1,
                                                        constant: 0.0)
        }else{
            leadingStickConstraint = NSLayoutConstraint(item: self.progressBarView!,
                                                        attribute: .leading,
                                                        relatedBy: .equal,
                                                        toItem: self.progressBackgroundView,
                                                        attribute: .leading,
                                                        multiplier: 1,
                                                        constant: 0.0)
        }
        
        
        let progressWidth = self.progressBackgroundView!.frame.size.width * (self.progressPercent / 100.0)
        self.progressBarViewWidthConstraint = NSLayoutConstraint(item: self.progressBarView!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: progressWidth)
        
        self.addConstraints([topSpaceConstraint,bottomSpaceConstraint,leadingStickConstraint,self.progressBarViewWidthConstraint!])
    }
    
    
    //====================================
    //MARK: Set progress
    //====================================
    func setProgress(percent:CGFloat){
        self.progressPercent = percent
        self.progressBarViewWidthConstraint?.constant = self.progressBackgroundView!.frame.size.width * (percent / 100.0)
        self.layoutIfNeeded()
    }
    

 

}
