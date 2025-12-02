import UIKit

final class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: UICollectionViewDataSource
    private let countProfiles = Profile.allCases
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countProfiles.count
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "theCell", for: indexPath)
        guard let cell = cell as? CollectionViewCell else { return UICollectionViewCell() }
        cell.label.text = countProfiles[indexPath.item].title
        
        return cell
    }

    // MARK: UICollectionViewDelegate
}
