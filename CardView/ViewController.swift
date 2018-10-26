//
//  ViewController.swift
//  CardView
//
//  
//

import UIKit

class ViewController: UIViewController {
    
   let array = ["Card 1","Card 2","Card 3","Card 4"]
   let arrayImage = [UIImage(named: "News 1"),UIImage(named: "News 2"),UIImage(named: "News 3"),UIImage(named: "News 4")]
  let stringDescription = ["Place 1","Place 2","Place 3","Place 4"]
    
    var posts = [Post]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let today = Date()
        let r = today.dayOfWeek()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.setTitle("\(r)")
        setupPosts()
        
    }
    


    func setupPosts() {
        for i in 0...3 {
            let title = array[i]
            let image = arrayImage[i]!
            let description = stringDescription[i]
            let userName = "User \(i + 1)"
            let newPost = Post(titleText: title, newsImage: image, description: description, userName: userName)
            posts.append(newPost)
        }
    }
}
extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
    
        cell.setup(from: posts[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return insets
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.bounds.width - 20
        let height: CGFloat  = 400
        return CGSize(width: width, height: height)
    }
}
extension UINavigationItem {
    
    func setTitle(_ title: String) {
        
        let view = HeaderView.init(frame: UIScreen.main.bounds)
        
        let dateLabel = UILabel(frame: view.bounds.insetBy(dx: 10, dy: 0))
        dateLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        dateLabel.text = title
        dateLabel.font = .systemFont(ofSize: 18.0)
        dateLabel.textColor = .gray
        
        view.addSubview(dateLabel)
//
//        dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        dateLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        dateLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        
        
        
        self.titleView = view
    }
    
}
extension Date {
    func dayOfWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, d MMMM"
        dateFormatter.locale  =  Locale(identifier: "ru-RU")
        return dateFormatter.string(from: self).capitalized
    }
}
