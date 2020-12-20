//
//  CollectionCellViewController.swift
//  MobileDevelopment
//
//  Created by Bogdan Pinkavsky
//

import UIKit

class CollectionCellViewController: UIViewController {
    @IBOutlet weak var cellCollectionView: UICollectionView!
    
    var photos: [PhotoCollectionCell] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellCollectionView.collectionViewLayout = CollectionCellViewController.createLayout()
        cellCollectionView.frame = .zero
        // Do any additional setup after loading the view.
    }
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        // items
        
        // first horizontal group
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(2/3),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        let verticalItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/2)
            )
        )
        
        let VerticalStackGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)
            ),
            subitem: verticalItem,
            count: 2
        )
        
        let FirstHorStackGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(2/5)
            ),
            subitems: [item, VerticalStackGroup]
        )
        
        // second horizontal group
        let sencondHorItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        let SecondHorStackGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/5)
            ),
            subitem: sencondHorItem,
            count: 3
        )
        
        // third horizontal group
        let thirdItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(2/3),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        let thirdVerticalItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/2)
            )
        )
        
        let ThirdVerticalStackGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)
            ),
            subitem: thirdVerticalItem,
            count: 2
        )
        
        let ThirdHorStackGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(2/5)
            ),
            subitems: [ThirdVerticalStackGroup, thirdItem]
        )
        // groups
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            ),
            subitems: [FirstHorStackGroup, SecondHorStackGroup, ThirdHorStackGroup]
        )

        // sections
        let section = NSCollectionLayoutSection(group: group)
        
        // return
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    @IBAction func didPressButton(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }

}

extension CollectionCellViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            photos.append(PhotoCollectionCell(image: image))
            cellCollectionView.reloadData()
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension CollectionCellViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        
        let photo = photos[indexPath.item]
        
        cell.setPhoto(photo: photo)
        cell.cellImage.clipsToBounds = true
        cell.cellImage.contentMode = .scaleAspectFill
        
        return cell
    }
}
