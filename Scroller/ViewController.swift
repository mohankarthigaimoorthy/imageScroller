//
//  ViewController.swift
//  Scroller
//
//  Created by Mohan K on 14/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderImageCollectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
  
    var imgArr = [ UIImage(named:"punkaj"),
                   UIImage(named: "joswa"),
                   UIImage(named:"santhanam"),
                   UIImage(named: "savukku"),
                UIImage(named:"kuttypuli"),
                UIImage(named:"purusothama"),
                   UIImage(named: "parvin"),
                   UIImage(named: "panner"),
                   UIImage(named: "puniyakodi"),
                   UIImage(named: "karuppu"),
                   UIImage(named: "kamal"),
                   UIImage(named: "kavibarathi"),
                   UIImage(named: "kavin"),
                   UIImage(named: "kavinila"),
                   UIImage(named: "karunakara"),
                UIImage(named: "sirppy")]
    
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.\
        pageView.currentPage = 0
        pageView.numberOfPages = imgArr.count
//        star()
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc func changeImage() {
        if counter < imgArr.count{
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderImageCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            counter += 1
            pageView.currentPage = counter
        }else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderImageCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageView.currentPage = counter
        }
    
    }
//    func star() {
//        sliderImageCollectionView.delegate = self
//        sliderImageCollectionView.dataSource = self
//        DispatchQueue.main.async {
//            self.sliderImageCollectionView.reloadData()
//        }
//    }
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count

    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sliderImageCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let vc = cell.viewWithTag(111) as? UIImageView {
            vc.image = imgArr[indexPath.row]
        }else if let ab = cell.viewWithTag(222) as? UIPageControl {
            ab.currentPage = indexPath.row
        }
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = sliderImageCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
