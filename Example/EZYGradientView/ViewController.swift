//
//  ViewController.swift
//  EZYGradientView
//
//  Created by Shashank on 21/07/16.
//  Copyright © 2016 Shashank. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
  @IBOutlet weak var navGradientView: EZYGradientView!
  @IBOutlet weak var tabGradientView: EZYGradientView!
  @IBOutlet weak var myTableView: UITableView!
  
  @IBOutlet weak var angleLabel: UILabel!
  @IBOutlet weak var fadeIntenLabel: UILabel!
  @IBOutlet weak var colorRatioLabel: UILabel!
  @IBOutlet weak var blurOpacLabel: UILabel!
  
  var angle:Float = 0.0
    {
    didSet
    {
      navGradientView.angleº = angle
      tabGradientView.angleº = angle
    }
  }
  
  var fadeIntesity:Float = 0.0
    {
    didSet
    {
      navGradientView.fadeIntensity = fadeIntesity
      tabGradientView.fadeIntensity = fadeIntesity
    }
  }
  
  var colorRatio:Float = 0.0
    {
    didSet
    {
      navGradientView.colorRatio = colorRatio
      tabGradientView.colorRatio = colorRatio
    }
  }
  
  var blurOpacity:Float = 0.0
    {
    didSet
    {
      navGradientView.blurOpacity = blurOpacity
      tabGradientView.blurOpacity = blurOpacity
    }
  }
  
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    myTableView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 118, right: 0)
    myTableView.scrollIndicatorInsets = myTableView.contentInset
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    tabGradientView.blurLayer?.cornerRadius = tabGradientView.frame.size.height/2
    tabGradientView.blurLayer?.masksToBounds = true
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10;
  }
  
  open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

    return cell;
  }
  
  
  @IBAction func sliderChangedValue(_ sender: AnyObject)
  {
    let slider = sender as! UISlider
    
    switch slider.tag {
    case 10:
      angle = ceilf(slider.value*360)
      angleLabel.text = String(format:"Angle->%.1f",angle)
      break
      
    case 11:
      fadeIntesity = floorf(slider.value * 10) / 10
      fadeIntenLabel.text = String(format:"Fade Intensity->%.1f", fadeIntesity)
      break
      
    case 12:
      colorRatio = floorf(slider.value * 10) / 10
      colorRatioLabel.text = String(format:"Color Ratio->%.1f",colorRatio)
      break
      
    case 13:
      blurOpacity = floorf(slider.value * 10) / 10
      blurOpacLabel.text = String(format:"Blur Opacity->%.1f",blurOpacity)
      break
      
    default:
      
      break
    }
  }
  
  
}
