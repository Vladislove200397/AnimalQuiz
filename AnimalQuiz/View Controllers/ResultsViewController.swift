//
//  FinalViewController.swift
//  AnimalQuiz
//
//  Created by Екатерина Батеева on 10.12.2020.
//

import UIKit

class ResultsViewController: UIViewController {
    var answerArray: [Answer]!
    
    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var desriptionLabel: UILabel!
    
    // 1. Передать сюда массив с ответами DONE
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты на экране
    // 4. Избавиться от кнопки возврата на предыдущий экран DONE

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        let maxAnimal = getMaxAnimal()
        updateUI(with: maxAnimal)
    }
    
}

extension ResultsViewController {
    private func getMaxAnimal() -> AnimalType? {
        return Dictionary(grouping: answerArray, by: {$0.type})
            .sorted(by: {$0.value.count > $1.value.count})
            .first?.key
    }
    
    private func updateResults() {
        
        var frequencyOfAnimals: [AnimalType: Int] = [:]
        let animals = answerArray.map { $0.type }
        
        for animal in animals {
                  if let animalTypeCount = frequencyOfAnimals[animal] {
                      frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
                  } else {
                      frequencyOfAnimals[animal] = 1
                  }
              }
    }
    
    private func updateUI(with animal: AnimalType?) {
        animalTypeLabel.text = "Вы - \(animal?.rawValue ?? "🤓" )!"
        desriptionLabel.text = animal?.definition ?? ""
    }
}
