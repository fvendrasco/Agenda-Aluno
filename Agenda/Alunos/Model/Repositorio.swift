//
//  Repositorio.swift
//  Agenda
//
//  Created by Felipe Augusto Vendrasco on 28/12/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit

class Repositorio: NSObject {

    func recuperaAlunos (complition:@escaping(_ listaDeAlunos:Array<Aluno>) -> Void){
        var alunos = AlunoDAO().recuperaAlunos()
        if alunos.count == 0 {
            AlunoAPI().recuperaAlunos {
                alunos = AlunoDAO().recuperaAlunos()
                complition(alunos)
            }
        }
        else {
            complition(alunos)
        }
    }
    
    func salvaAluno(aluno:Dictionary<String, String>){
        AlunoAPI().salvaAlunosNoServidor(parametros: [aluno])
        AlunoDAO().salvaAluno(dicionarioDeAluno: aluno)
    }
}
