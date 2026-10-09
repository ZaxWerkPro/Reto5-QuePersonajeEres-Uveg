//
//  ViewController.swift
//  Reto 5 - Que personaje eres
//
//  Created by Forte Apps on 20/07/20.
//  Copyright © 2020 UVEG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // =====================================================
    // RETO 5: ¿QUÉ PERSONAJE ERES? - UVEG
    // Alumno: Gustavo Ávila García
    // =====================================================

    // 1. ESTRUCTURAS DE DATOS (Colecciones)
    struct Pregunta {
        let texto: String
        let opciones: [String]
    }

    // Diccionario de personajes con sus descripciones
    let personajes: [String: String] = [
        "Iron Man": "Eres un genio, millonario, playboy y filántropo. Te gusta la tecnología y liderar al equipo.",
        "Capitán América": "Eres un líder nato con un fuerte sentido de la justicia y la moral. Siempre defiendes a los débiles.",
        "Thor": "Eres poderoso, impulsivo y leal. A veces actúas sin pensar, pero tienes un gran corazón.",
        "Hulk": "Eres fuerte, pero a veces te cuesta controlar tus emociones. Cuando te enfadas, ¡cuidado!",
        "Viuda Negra": "Eres astuto, sigiloso y estratégico. Prefieres resolver las cosas con inteligencia antes que con fuerza."
    ]

    // Arreglo de preguntas
    let preguntas: [Pregunta] = [
        Pregunta(texto: "¿Cómo prefieres resolver un problema?", opciones: ["Con tecnología", "Con fuerza bruta", "Con estrategia", "Con diálogo"]),
        Pregunta(texto: "¿Qué valoras más en un equipo?", opciones: ["La inteligencia", "La lealtad", "La valentía", "La astucia"]),
        Pregunta(texto: "¿Cuál es tu pasatiempo favorito?", opciones: ["Inventar cosas", "Entrenar", "Leer", "Meditar"]),
        Pregunta(texto: "¿Cómo reaccionas ante una injusticia?", opciones: ["La analizo", "La enfrento directamente", "Busco aliados", "La evito"]),
        Pregunta(texto: "¿Qué te motiva?", opciones: ["El conocimiento", "La justicia", "El poder", "La venganza"])
    ]

    // Arreglo para almacenar las respuestas del usuario
    var respuestasUsuario: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Iniciar el cuestionario al cargar la vista
        iniciarCuestionario()
    }

    // =====================================================
    // 2. LÓGICA DEL CUESTIONARIO (Operadores y Estructuras)
    // =====================================================

    func iniciarCuestionario() {
        print("=== CUESTIONARIO: ¿QUÉ PERSONAJE ERES? ===")
        print("Responde las siguientes 5 preguntas.\n")

        // Estructura iterativa: for-in para recorrer las preguntas
        for (index, pregunta) in preguntas.enumerated() {
            print("Pregunta \(index + 1): \(pregunta.texto)")

            // Mostrar opciones
            for (i, opcion) in pregunta.opciones.enumerated() {
                print("  \(i + 1). \(opcion)")
            }

            var respuestaValida = false

            // Estructura iterativa: while para validar la respuesta
            while !respuestaValida {
                print("Selecciona una opción (1-\(pregunta.opciones.count)): ", terminator: "")

                if let input = readLine(), let seleccion = Int(input) {
                    // Operador de comparación: verificar rango válido
                    if seleccion >= 1 && seleccion <= pregunta.opciones.count {
                        respuestasUsuario.append(seleccion - 1)
                        respuestaValida = true
                    } else {
                        print("❌ Opción no válida. Intenta de nuevo.")
                    }
                } else {
                    print("❌ Entrada no válida. Ingresa un número.")
                }
            }
            print("")
        }

        // Al terminar, calcular resultado
        calcularResultado()
    }

    func calcularResultado() {
        // Diccionario para acumular puntuaciones
        var puntuaciones: [String: Int] = [
            "Iron Man": 0, "Capitán América": 0, "Thor": 0, "Hulk": 0, "Viuda Negra": 0
        ]

        // Estructura iterativa: for-in para recorrer respuestas y sumar puntos
        for (index, respuesta) in respuestasUsuario.enumerated() {
            switch index {
            case 0:
                if respuesta == 0 { puntuaciones["Iron Man"]! += 2 }
                else if respuesta == 1 { puntuaciones["Hulk"]! += 2 }
                else if respuesta == 2 { puntuaciones["Viuda Negra"]! += 2 }
                else { puntuaciones["Capitán América"]! += 2 }
            case 1:
                if respuesta == 0 { puntuaciones["Iron Man"]! += 2 }
                else if respuesta == 1 { puntuaciones["Capitán América"]! += 2 }
                else if respuesta == 2 { puntuaciones["Thor"]! += 2 }
                else { puntuaciones["Viuda Negra"]! += 2 }
            case 2:
                if respuesta == 0 { puntuaciones["Iron Man"]! += 2 }
                else if respuesta == 1 { puntuaciones["Thor"]! += 2 }
                else if respuesta == 2 { puntuaciones["Capitán América"]! += 2 }
                else { puntuaciones["Viuda Negra"]! += 2 }
            case 3:
                if respuesta == 0 { puntuaciones["Iron Man"]! += 2 }
                else if respuesta == 1 { puntuaciones["Hulk"]! += 2 }
                else if respuesta == 2 { puntuaciones["Capitán América"]! += 2 }
                else { puntuaciones["Viuda Negra"]! += 2 }
            case 4:
                if respuesta == 0 { puntuaciones["Iron Man"]! += 2 }
                else if respuesta == 1 { puntuaciones["Capitán América"]! += 2 }
                else if respuesta == 2 { puntuaciones["Thor"]! += 2 }
                else { puntuaciones["Viuda Negra"]! += 2 }
            default:
                break
            }
        }

        // Determinar el ganador
        var personajeGanador = ""
        var puntajeMaximo = 0

        // Estructura iterativa: for-in para encontrar el máximo
        for (personaje, puntaje) in puntuaciones {
            if puntaje > puntajeMaximo {
                puntajeMaximo = puntaje
                personajeGanador = personaje
            }
        }

        // Mostrar resultado final
        print("========================================")
        print("🎉 TU PERSONAJE ES: \(personajeGanador)")
        print("========================================")
        if let descripcion = personajes[personajeGanador] {
            print(descripcion)
        }
        print("========================================")
    }

}