//
//  TarefaTableViewController.swift
//  Agenda
//
//  Created by Bruno Omella Mainieri on 6/1/15.
//  Copyright (c) 2015 Melhor Grupo. All rights reserved.
//

import UIKit

class TarefaTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var materia:Materia!
    var tarefas:NSMutableArray!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tarefas = NSMutableArray(array: TarefaManager.sharedInstance.fetchTarefasForMateria(self.materia))
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        tarefas = NSMutableArray(array: TarefaManager.sharedInstance.fetchTarefasForMateria(self.materia))
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tarefas.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        let cell = tableView.dequeueReusableCellWithIdentifier("tarefaCelula") as! TarefasCell
        cell.nome?.text = (self.tarefas.objectAtIndex(indexPath.row) as! Atividade).nomeAtiv
        
//        cell.detailTextLabel?.text = "\((self.tarefas.objectAtIndex(indexPath.row) as! Atividade).nota)"
        
        let dateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "dd/MM/yyyy - HH:mm";
        cell.data?.text = dateFormatter.stringFromDate((self.tarefas.objectAtIndex(indexPath.row) as! Atividade).dataEntrega);
        
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        (segue.destinationViewController as! AddTarefaViewController).materia = self.materia
    }
    

}