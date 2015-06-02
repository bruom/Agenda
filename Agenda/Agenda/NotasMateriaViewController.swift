//
//  NotasMateriaViewController.swift
//  Agenda
//
//  Created by Bruno Omella Mainieri on 6/2/15.
//  Copyright (c) 2015 Melhor Grupo. All rights reserved.
//

import UIKit

class NotasMateriaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var materia:Materia!
    var tarefas:NSMutableArray!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Relatorio para \(materia.nomeMateria)"
        
        self.tarefas = NSMutableArray(array: TarefaManager.sharedInstance.fetchTarefasForMateria(materia))

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table View
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tarefas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: nil)
        
        cell.textLabel?.text = (tarefas.objectAtIndex(indexPath.row) as! Atividade).nomeAtiv
        
        let nota = (tarefas.objectAtIndex(indexPath.row) as! Atividade).nota
        
        cell.detailTextLabel?.text = "\(nota)"
        
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
