//
//  Functions.swift
//  InternshipAtAvitoMironenko
//
//  Created by Роман Мироненко on 02.01.2021.
//  Copyright © 2021 Роман Мироненко. All rights reserved.
//

func setup<Type>(_ object: Type, block: (Type) -> Void) -> Type {
    block(object)
    return object
}
