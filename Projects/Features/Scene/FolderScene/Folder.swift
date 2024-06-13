//
//  Folder.swift
//  Folder
//
//  Created by 김영균 on 6/13/24.
//  Copyright © 2024 mashup.dorabangs. All rights reserved.
//

import ComposableArchitecture

@Reducer
public struct Folder {
    @ObservableState
    public struct State: Equatable {
        public static let initialState = State()
        public init() {}
    }
    
    public enum Action {
        case onAppear
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .none
            }
        }
    }
}
