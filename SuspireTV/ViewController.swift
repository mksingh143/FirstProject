//
//  ViewController.swift
//  SuspireTV
//
//  Created by Manoj Kumar Singh on 06/12/17.
//  Copyright © 2017 SoftIndigo. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
   
    @IBOutlet weak var collectionView: UICollectionView!
    var dataArray = NSArray()
    var dataitem = DataModel()
    let originalCellSize = CGSize(width: 300, height: 300)//CGSize(x:225, 354)
    let focusCellSize = CGSize(width: 310, height: 325)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJsonFromUrl()
    }

    func getJsonFromUrl() {
        let URLString = "http://www.totalvdo.com/demo/game/suspiretv.php"
        let url = URL(string: URLString)
        
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                if (jsonObj!.value(forKey: "subcategory") as? NSArray) != nil {
                    self.dataArray = (jsonObj!.value(forKey: "subcategory") as? NSArray)!
            
                    
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }).resume()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       
        return dataArray.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            
            let data =  dataArray[0] as! Dictionary<String,AnyObject>
            let td = data["contents"] as! NSArray
           // let val = td[0] as! Dictionary<String,String>

            return td.count
        }
        else if section == 1{
            let data =  dataArray[1] as! Dictionary<String,AnyObject>
            let td = data["contents"] as! NSArray
           
             return td.count
        }
        else if section == 2{
            let data =  dataArray[2] as! Dictionary<String,AnyObject>
            let td = data["contents"] as! NSArray
            
            return td.count
        }
        else if section == 3{
            let data =  dataArray[3] as! Dictionary<String,AnyObject>
            let td = data["contents"] as! NSArray
            
            return td.count
        }
        else{
            let data =  dataArray[4] as! Dictionary<String,AnyObject>
            let td = data["contents"] as! NSArray
            
            return td.count
        }

    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        if  indexPath.section == 0{
            let data =  dataArray[0] as! Dictionary<String,AnyObject>
            let contentsData = data["contents"] as! NSArray
            let value = contentsData[indexPath.row] as! Dictionary<String,String>
            cell.videoTitle.text = value["title"]! as String
            //cell.imageView.sd_setImage(with:value["image"]! as String, placeholderImage: UIImage(data: data as Data))
            if let url = NSURL(string: value["image"]! as String) {
                if let data = NSData(contentsOf: url as URL) {
                    cell.imageView.image = UIImage(data: data as Data)
               }
                
            }
            return cell
        }
        else if indexPath.section == 1{
            let data =  dataArray[1] as! Dictionary<String,AnyObject>
            let contentsData = data["contents"] as! NSArray
            let value = contentsData[indexPath.row] as! Dictionary<String,String>
            cell.videoTitle.text = value["title"]! as String
            if let url = NSURL(string: value["image"]! as String) {
                if let data = NSData(contentsOf: url as URL) {
                    cell.imageView.image = UIImage(data: data as Data)
                }
            }
             return cell
        }
        else if indexPath.section == 2{
            let data =  dataArray[2] as! Dictionary<String,AnyObject>
            let contentsData = data["contents"] as! NSArray
            let value = contentsData[indexPath.row] as! Dictionary<String,String>
            cell.videoTitle.text = value["title"]! as String
            if let url = NSURL(string: value["image"]! as String) {
                if let data = NSData(contentsOf: url as URL) {
                    cell.imageView.image = UIImage(data: data as Data)
                }
            }
            
            return cell
        }
        else if indexPath.section == 2{
            let data =  dataArray[3] as! Dictionary<String,AnyObject>
            let contentsData = data["contents"] as! NSArray
            let value = contentsData[indexPath.row] as! Dictionary<String,String>
            cell.videoTitle.text = value["title"]! as String
            if let url = NSURL(string: value["image"]! as String) {
                if let data = NSData(contentsOf: url as URL) {
                    cell.imageView.image = UIImage(data: data as Data)
                }
                
            }
            
            return cell
        }
        else{
            let data =  dataArray[4] as! Dictionary<String,AnyObject>
            let contentsData = data["contents"] as! NSArray
            let value = contentsData[indexPath.row] as! Dictionary<String,String>
            cell.videoTitle.text = value["title"]! as String
            if let url = NSURL(string: value["image"]! as String) {
                if let data = NSData(contentsOf: url as URL) {
                    cell.imageView.image = UIImage(data: data as Data)
                }
                
            }
            return cell
        }
       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
    switch kind {
    case UICollectionElementKindSectionHeader:
    let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as! HeaderCollectionReusableView
    
    if indexPath.section == 0{
        let data =  dataArray[0] as! Dictionary<String,AnyObject>
        reusableview.titleLabel.text = (data["subcategory_name"] as! String)
            return reusableview
        }
    else if indexPath.section == 1{
        let data =  dataArray[1] as! Dictionary<String,AnyObject>
        reusableview.titleLabel.text = (data["subcategory_name"] as! String)
        return reusableview
        }
    else if indexPath.section == 2{
        let data =  dataArray[2] as! Dictionary<String,AnyObject>
        reusableview.titleLabel.text = (data["subcategory_name"] as! String)
        return reusableview
    }
    else if indexPath.section == 3{
        let data =  dataArray[3] as! Dictionary<String,AnyObject>
        reusableview.titleLabel.text = (data["subcategory_name"] as! String)
        return reusableview
        }
    else{
        let data =  dataArray[4] as! Dictionary<String,AnyObject>
        reusableview.titleLabel.text = (data["subcategory_name"] as! String)
        return reusableview
        }
        
        
    default:  fatalError("Unexpected element kind")
    }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let videoPlayerViewController =  (self.storyboard?.instantiateViewController(withIdentifier: "VideoPlayerViewController") as? VideoPlayerViewController)!
        if  indexPath.section == 0{
            let data =  dataArray[0] as! Dictionary<String,AnyObject>
            let contentsData = data["contents"] as! NSArray
            let value = contentsData[indexPath.row] as! Dictionary<String,String>
            videoPlayerViewController.videoTitle = value["title"]! as String
            videoPlayerViewController.videoUrl = value["vod_url"]! as String
            videoPlayerViewController.videoInfo = value["description"]! as String
           
           }
        else if indexPath.section == 1{
            let data =  dataArray[1] as! Dictionary<String,AnyObject>
            let contentsData = data["contents"] as! NSArray
            let value = contentsData[indexPath.row] as! Dictionary<String,String>
            videoPlayerViewController.videoUrl = value["vod_url"]! as String
            videoPlayerViewController.videoTitle = value["title"]! as String
            videoPlayerViewController.videoInfo = value["description"]! as String
        }
        else if indexPath.section == 2{
            let data =  dataArray[2] as! Dictionary<String,AnyObject>
            let contentsData = data["contents"] as! NSArray
            let value = contentsData[indexPath.row] as! Dictionary<String,String>
            videoPlayerViewController.videoUrl = value["vod_url"]! as String
            videoPlayerViewController.videoTitle = value["title"]! as String
            videoPlayerViewController.videoInfo = value["description"]! as String
        }
        else if indexPath.section == 3{
            let data =  dataArray[3] as! Dictionary<String,AnyObject>
            let contentsData = data["contents"] as! NSArray
            let value = contentsData[indexPath.row] as! Dictionary<String,String>
            videoPlayerViewController.videoUrl = value["vod_url"]! as String
            videoPlayerViewController.videoTitle = value["title"]! as String
            videoPlayerViewController.videoInfo = value["description"]! as String
        }
        else {
            let data =  dataArray[4] as! Dictionary<String,AnyObject>
            let contentsData = data["contents"] as! NSArray
            let value = contentsData[indexPath.row] as! Dictionary<String,String>
            videoPlayerViewController.videoUrl = value["vod_url"]! as String
            videoPlayerViewController.videoTitle = value["title"]! as String
            videoPlayerViewController.videoInfo = value["description"]! as String
        }
        
        self.navigationController?.pushViewController(videoPlayerViewController, animated: true)
    }
    
 
    
    func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
        if let previousItem = context.previouslyFocusedView as? MovieCollectionViewCell {
            UIView.animate(withDuration: 0.2, animations: { () -> Void in
                previousItem.imageView.frame.size = CGSize(width: 300, height: 300)
                previousItem.backgroundColor = UIColor.gray
            })
        }
        if let nextItem = context.nextFocusedView as? MovieCollectionViewCell {
            UIView.animate(withDuration: 0.2, animations: { () -> Void in
                nextItem.imageView.frame.size = CGSize(width: 310, height: 310)
                 nextItem.backgroundColor = UIColor.red
            })
        }
}
}
