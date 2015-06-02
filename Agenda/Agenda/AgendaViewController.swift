//
//  AgendaViewController.swift
//  Agenda
//
//  Created by Bruno Omella Mainieri on 6/2/15.
//  Copyright (c) 2015 Melhor Grupo. All rights reserved.
//

import UIKit

class AgendaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    var atividades:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        atividades = NSMutableArray(array: TarefaManager.sharedInstance.fetchTarefasFuturas())

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentButton(sender: AnyObject) {
        if self.segmentControl.selectedSegmentIndex == 0 {
            atividades = NSMutableArray(array: TarefaManager.sharedInstance.fetchTarefasFuturas())
        }
        else {
            atividades = NSMutableArray(array: TarefaManager.sharedInstance.fetchTarefasPassadas())
        }
        self.tableView.reloadData()
    }
    
    // MARK: - Table View
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return atividades.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        //let cell = tableView.dequeueReusableCellWithIdentifier("tarefaCelula") as! TarefasCell
        
        cell.textLabel?.text = (atividades.objectAtIndex(indexPath.row) as! Atividade).nomeAtiv
        
        let dateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "dd/MM/yyyy - HH:mm";
        cell.detailTextLabel?.text = dateFormatter.stringFromDate((self.atividades.objectAtIndex(indexPath.row) as! Atividade).dataEntrega);
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}