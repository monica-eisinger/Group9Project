//
//  ViewController.swift
//  SampleProject
//
//  Created by Sayeed Munawar Hussain on 09/12/16.
//  Copyright © 2016 *. All rights reserved.
//
// Reused by Monica Eisinger

import UIKit

var dropdownval = ["", "", "", "", "", "", "", "", "", ""]//[String]()
var returned_top_diseases = ["", "", "", "", ""]
var count = 0

class ViewController: UIViewController{
    
    // symptom labels
    @IBOutlet weak var symptom1: UILabel!
    @IBOutlet weak var symptom2: UILabel!
    @IBOutlet weak var symptom3: UILabel!
    @IBOutlet weak var symptom4: UILabel!
    @IBOutlet weak var symptom5: UILabel!
    @IBOutlet weak var symptom6: UILabel!
    @IBOutlet weak var symptom7: UILabel!
    @IBOutlet weak var symptom8: UILabel!
    @IBOutlet weak var symptom9: UILabel!
    @IBOutlet weak var symptom10: UILabel!
    
    // the background image
    @IBOutlet var background2: UIView!
    
    @IBAction func search_symptoms_button(_ sender: Any) {
        // search diseases with the symptoms
        returned_top_diseases = find_disease(array: dropdownval)
    }
    
    func label_update () {
        symptom1.text = dropdownval[0]
        symptom1.sizeToFit()
        
        symptom2.text = dropdownval[1]
        symptom2.sizeToFit()
        
        symptom3.text = dropdownval[2]
        symptom3.sizeToFit()
        
        symptom4.text = dropdownval[3]
        symptom4.sizeToFit()
        
        symptom5.text = dropdownval[4]
        symptom5.sizeToFit()
        
        symptom6.text = dropdownval[5]
        symptom6.sizeToFit()
        
        symptom7.text = dropdownval[6]
        symptom7.sizeToFit()
        
        symptom8.text = dropdownval[7]
        symptom8.sizeToFit()
        
        symptom9.text = dropdownval[8]
        symptom9.sizeToFit()
        
        symptom10.text = dropdownval[9]
        symptom10.sizeToFit()
    }
    
    
    @IBAction func clear_search_button(_ sender: Any) {
        // reset the dropdownval, index count for filling in the dropdownval, and update the labels
        dropdownval = ["", "", "", "", "", "", "", "", "", ""]
        count = 0
        
        label_update()
    }
    
    
    @IBOutlet fileprivate weak var textField: SearchTextField!
    
    override func viewDidLoad() {
        label_update()
        
        background2.backgroundColor = UIColor(patternImage: UIImage(named: "21677087.jpg")!)

        self.textField.searchDelegate = self
        
        // all of the values to be displayed in the drop-down box
        self.textField.setDataSource([
            "pain chest",
            "shortness of breath",
            "dizziness",
            "asthenia",
            "fall",
            "syncope",
            "vertigo",
            "sweat",
            "palpitation",
            "nausea",
            "angina pectoris",
            "pressure chest",
            "polyuria",
            "polydypsia",
            "orthopnea",
            "rale",
            "unresponsiveness",
            "mental status changes",
            "vomiting",
            "labored breathing",
            "feeling suicidal",
            "suicidal",
            "hallucinations auditory",
            "feeling hopeless",
            "weepiness",
            "sleeplessness",
            "motor retardation",
            "irritable mood",
            "blackout",
            "mood depressed",
            "hallucinations visual",
            "worry",
            "agitation",
            "tremor",
            "intoxication",
            "verbal auditory hallucinations",
            "energy increased",
            "difficulty",
            "nightmare",
            "unable to concentrate",
            "homelessness",
            "hypokinesia",
            "dyspnea on exertion",
            "chest tightness",
            "cough",
            "fever",
            "decreased translucency",
            "productive cough",
            "pleuritic pain",
            "yellow sputum",
            "breath sounds decreased",
            "chill",
            "rhonchus",
            "green sputum",
            "non-productive cough",
            "wheezing",
            "haemoptysis",
            "distress respiratory",
            "tachypnea",
            "malaise",
            "night sweat",
            "jugular venous distention",
            "dyspnea",
            "dysarthria",
            "speech slurred",
            "facial paresis",
            "hemiplegia",
            "seizure",
            "numbness",
            "symptom aggravating factors",
            "st segment elevation",
            "st segment depression",
            "t wave inverted",
            "presence of q wave",
            "chest discomfort",
            "bradycardia",
            "pain",
            "nonsmoker",
            "erythema",
            "hepatosplenomegaly",
            "pruritus",
            "diarrhea",
            "abscess bacterial",
            "swelling",
            "apyrexial",
            "dysuria",
            "hematuria",
            "renal angle tenderness",
            "lethargy",
            "hyponatremia",
            "hemodynamically stable",
            "difficulty passing urine",
            "consciousness clear",
            "guaiac positive",
            "monoclonal",
            "ecchymosis",
            "tumor cell invasion",
            "haemorrhage",
            "pallor",
            "fatigue",
            "heme positive",
            "pain back",
            "orthostasis",
            "arthralgia",
            "transaminitis",
            "sputum purulent",
            "hypoxemia",
            "hypercapnia",
            "patient non compliance",
            "unconscious state",
            "bedridden",
            "abdominal tenderness",
            "unsteady gait",
            "hyperkalemia",
            "urgency of micturition",
            "ascites",
            "hypotension",
            "enuresis",
            "asterixis",
            "muscle twitch",
            "sleepy",
            "headache",
            "lightheadedness",
            "food intolerance",
            "numbness of hand",
            "general discomfort",
            "drowsiness",
            "stiffness",
            "prostatism",
            "weight gain",
            "mass of body structure",
            "has religious belief",
            "nervousness",
            "formication",
            "hot flush",
            "lesion",
            "cushingoid facies",
            "emphysematous change",
            "decreased body weight",
            "hoarseness",
            "thicken",
            "spontaneous rupture of membranes",
            "muscle hypotonia",
            "redness",
            "hypesthesia",
            "hyperacusis",
            "scratch marks",
            "sore to touch",
            "burning sensation",
            "satiety early",
            "throbbing sensation quality",
            "sensory discomfort",
            "constipation",
            "pain abdominal",
            "heartburn",
            "breech presentation",
            "cyanosis",
            "pain in lower limb",
            "cardiomegaly",
            "clonus",
            "unwell",
            "anorexia",
            "anosmia",
            "metastatic lesion",
            "hemianopsia homonymous",
            "hematocrit decreased",
            "neck stiffness",
            "cicatrisation",
            "hypometabolism",
            "aura",
            "myoclonus",
            "gurgle",
            "wheelchair bound",
            "left atrial hypertrophy",
            "oliguria",
            "catatonia",
            "unhappy",
            "paresthesia",
            "gravida 0",
            "lung nodule",
            "distended abdomen",
            "ache",
            "macerated skin",
            "heavy feeling",
            "rest pain",
            "sinus rhythm",
            "withdraw",
            "behavior hyperactive",
            "terrify",
            "photopsia",
            "giddy mood",
            "disturbed family",
            "hypersomnia",
            "hyperhidrosis disorder",
            "mydriasis",
            "extrapyramidal sign",
            "loose associations",
            "exhaustion",
            "snore",
            "r wave feature",
            "fatigue",
            "overweight",
            "systolic murmur",
            "drowsiness",
            "asymptomatic",
            "splenomegaly",
            "bleeding of vagina",
            "macule",
            "photophobia",
            "painful swallowing",
            "cachexia",
            "hypocalcemia result",
            "hypothermia, natural",
            "atypia",
            "general unsteadiness",
            "throat sore",
            "snuffle",
            "hacking cough",
            "stridor",
            "paresis",
            "aphagia",
            "focal seizures",
            "abnormal sensation",
            "stupor",
            "fremitus",
            "Stahli's line",
            "stinging sensation",
            "paralyse",
            "hirsutism",
            "sniffle",
            "bradykinesia",
            "out of breath",
            "urge incontinence",
            "vision blurred",
            "room spinning",
            "rambling speech",
            "clumsiness",
            "decreased stool caliber",
            "hematochezia",
            "egophony",
            "neologism",
            "decompensation",
            "stool color yellow",
            "rigor - temperature-associated observation",
            "paraparesis",
            "moody",
            "fear of falling",
            "spasm",
            "hyperventilation",
            "excruciating pain",
            "gag",
            "posturing",
            "pulse absent",
            "dysesthesia",
            "polymyalgia",
            "passed stones",
            "qt interval prolonged",
            "ataxia",
            "Heberden's node",
            "hepatomegaly",
            "sciatica",
            "frothy sputum",
            "mass in breast",
            "retropulsion",
            "estrogen use",
            "hypersomnolence",
            "underweight",
            "dullness",
            "red blotches",
            "colic abdominal",
            "hypokalemia",
            "hunger",
            "prostate tender",
            "pain foot",
            "urinary hesitation",
            "disequilibrium",
            "flushing",
            "indifferent mood",
            "urinoma",
            "hypoalbuminemia",
            "pustule",
            "slowing of urinary stream",
            "extreme exhaustion",
            "no status change",
            "breakthrough pain",
            "pansystolic murmur",
            "systolic ejection murmur",
            "stuffy nose",
            "barking cough",
            "rapid shallow breathing",
            "noisy respiration",
            "nasal discharge present",
            "frail",
            "cystic lesion",
            "projectile vomiting",
            "heavy legs",
            "titubation",
            "dysdiadochokinesia",
            "achalasia",
            "side pain",
            "monocytosis",
            "posterior rhinorrhea",
            "incoherent",
            "lameness",
            "clammy skin",
            "mediastinal shift",
            "nausea and vomiting",
            "awakening early",
            "tenesmus",
            "fecaluria",
            "pneumatouria",
            "todd paralysis",
            "alcoholic withdrawal symptoms",
            "myalgia",
            "dyspareunia",
            "poor dentition",
            "floppy",
            "inappropriate affect",
            "poor feeding",
            "moan",
            "welt",
            "tinnitus",
            "hydropneumothorax",
            "superimposition",
            "feeling strange",
            "uncoordination",
            "absences finding",
            "tonic seizures",
            "debilitation",
            "impaired cognition",
            "drool",
            "pin-point pupils",
            "tremor resting",
            "groggy",
            "adverse reaction",
            "abdominal bloating",
            "fatigability",
            "para 2",
            "abortion",
            "intermenstrual heavy bleeding",
            "previous pregnancies 2",
            "primigravida",
            "abnormally hard consistency",
            "proteinemia",
            "pain neck",
            "dizzy spells",
            "shooting pain",
            "hyperemesis",
            "milky",
            "regurgitates after swallowing",
            "lip smacking",
            "phonophobia",
            "rolling of eyes",
            "ambidexterity",
            "pulsus paradoxus",
            "gravida 10",
            "bruit",
            "breath-holding spell",
            "scleral icterus",
            "retch",
            "blanch",
            "elation",
            "verbally abusive behavior",
            "transsexual",
            "behavior showing increased motor activity",
            "scar tissue",
            "coordination abnormal",
            "choke",
            "bowel sounds decreased",
            "no known drug allergies",
            "low back pain",
            "charleyhorse",
            "sedentary",
            "feels hot/feverish",
            "flare",
            "pericardial friction rub",
            "hoard",
            "panic",
            "cardiovascular finding",
            "soft tissue swelling",
            "rhd positive",
            "para 1",
            "nasal flaring",
            "sneeze",
            "hypertonicity",
            "Murphy's sign",
            "flatulence",
            "gasping for breath",
            "feces in rectum",
            "prodrome",
            "hypoproteinemia",
            "alcohol binge episode",
            "abdomen acute",
            "air fluid level",
            "catching breath",
            "large-for-dates fetus",
            "immobile",
            "homicidal thoughts"])
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: SearchTextFieldDelegate {
    
    // captures the value typed into the text field
    func didSelectResult(_ result: String) {
        self.textField.text = result
        
        dropdownval[count] = result
        count += 1
        
        label_update()
        
        // reset the text field to be empty
        self.textField.text = ""
    }
    
}


