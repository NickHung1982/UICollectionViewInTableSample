//
//  Main_ViewController.swift
//  TableCollectionViewSample
//
//  Created by Nick on 5/28/23.
//

import UIKit

class Main_ViewController: UITableViewController {
    let data = Datasource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    private func getObject(_ index: Int) -> TableViewCellModel {
        return data.objectsArray[index % data.objectsArray.count]
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (data.objectsArray.count * 2)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return getObject(indexPath.row).cellHeight
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let objectdata = getObject(indexPath.row)
      
        if objectdata.cellType == .singleBanner {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_Banner_Large", for: indexPath) as! SingleBannerCell
            cell.lb_title.text = objectdata.cellItems.first!.title
            return cell
        }else if objectdata.cellType == .splitBanner {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_Banner_Split", for: indexPath) as! SplitBannerCell
            cell.btn1.setTitle(objectdata.cellItems[0].title, for: .normal)
            cell.btn2.setTitle(objectdata.cellItems[1].title, for: .normal)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_Collection", for: indexPath) as! CollectionsCell
            cell.cellmodel = objectdata
            return cell
        }
        

        
    }
    


}
