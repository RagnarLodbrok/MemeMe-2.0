//
//  MemeCollectionViewController.swift
//  
//
//  Created by Gil Felot on 27/08/15.
//
//

import UIKit

let reuseIdentifier = "MemeCollectionViewCell"

class MemeCollectionViewController: UICollectionViewController, UICollectionViewDataSource {

    @IBOutlet weak var flowLayout : UICollectionViewFlowLayout!
    
    var memes: [Meme]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let applicationDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
//        self.navigationItem.rightBarButtonItem = self.
        
        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        let space: CGFloat = 3.0
        let dimension = (self.view.frame.size.width - (2*space)) / 3 //3 per line
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSizeMake(dimension, dimension)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        memes = appDelegate.memes
    }


    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 0
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return 0
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! UICollectionViewCell
    
        // Configure the cell
    
        return cell
    }
    
    @IBAction func addMeme(sender: AnyObject) {
        performSegueWithIdentifier("addMemeFromCollection", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "addMemeFromCollection") {
            let editorVC: MemeEditorViewController = segue.destinationViewController as! MemeEditorViewController
        }
    }
    
    
}

























