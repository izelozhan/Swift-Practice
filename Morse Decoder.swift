//
//  Morse Decoder.swift
//  
//
//  Created by Izel on 9/8/25.
//

import Foundation

var englishText = "this is a secret message"

var secretMessage = ".... --- .-- -.. -.--   .--. .- .-. - -. . .-."

var letterToMorse: [String: String] = [
  "a": ".-",
  "b": "-...",
  "c": "-.-.",
  "d": "-..",
  "e": ".",
  "f": "..-.",
  "g": "--.",
  "h": "....",
  "i": "..",
  "j": ".---",
  "k": "-.-",
  "l": ".-..",
  "m": "--",
  "n": "-.",
  "o": "---",
  "p": ".--.",
  "q": "--.-",
  "r": ".-.",
  "s": "...",
  "t": "-",
  "u": "..-",
  "v": "...-",
  "w": ".--",
  "x": "-..-",
  "y": "-.--",
  "z": "--.."
]


//Each character is separated by a single space.
//Each word is separated by three spaces.
//Capitalization does not matter.

var morseText = ""

for element in englishText {
  if let morseChar = letterToMorse["\(element)"] {
    morseText += morseChar + " "
  } else {
    morseText += "   "
  }
}

print(morseText)

var decodedMessage = ""
var morseCodeArray = [String]()
var currMorse = ""

for char in secretMessage {
  if char != " " {
    currMorse.append(char)
  } else {
    switch currMorse {
      case "":
      currMorse += " "
      case " ":
      morseCodeArray.append(" ")
      currMorse = ""
      default:
      morseCodeArray.append(currMorse)
      currMorse = ""
    }
  }
}

morseCodeArray.append(currMorse)
print(morseCodeArray)

var morseToLetter = [String:String]()

for (letter, morseChar) in letterToMorse {
  morseToLetter[morseChar] = letter
}

for morseValue in morseCodeArray {
  if let letterChar = morseToLetter[morseValue] {
    decodedMessage += letterChar
  } else {
    decodedMessage += " "
  }
}

print (decodedMessage)

















