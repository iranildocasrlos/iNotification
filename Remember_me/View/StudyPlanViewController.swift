//
//  StudyPlanViewController.swift
//  Remember_me
//
//  Created by Iranildo C. Silva on 12/03/20.
//  Copyright © 2020 Local Oeste Software House. All rights reserved.
//

import UIKit
import UserNotifications


class StudyPlanViewController: UIViewController {
    
    
    @IBOutlet weak var tfCourse: UITextField!
    
    @IBOutlet weak var tfSection: UITextField!
    
    @IBOutlet weak var dpDate: UIDatePicker!
    
    let sm = StudyManager.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dpDate.minimumDate = Date()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func schedule(_ sender: Any) {
        
        let id = String(Date().timeIntervalSince1970)
        let studyPlan = StudyPlain(task: tfCourse.text!, section: tfSection.text!, date: dpDate.date, done: false, id: id)
        
        
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.subtitle = "Task : \(studyPlan.task)"
        content.body = "Remember : \(studyPlan.section)"
        
        
        //Configurando a notificação
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "toque_agua.mp3"))
        content.categoryIdentifier = "Remember"
        
        //Cria o gatilho para disparar a notificação
        
        //intervalo de tempo
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 15, repeats: false)
        
        //requisisção de notificação
        let request  = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        //adiciona a notificação a central de notificação
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        
        
        sm.addPlan(studyPlan)
        
        navigationController?.popViewController(animated: true)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
