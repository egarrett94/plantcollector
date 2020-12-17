//
//  ContentView.swift
//  PlantCollector
//
//  Created by Lemon Garrett on 12/2/20.
//

import SwiftUI
import Alamofire

struct PlantListResponse: Decodable {
   let plants: [Plant]
    
   enum CodingKeys: String, CodingKey {
        case plants = "data"
    }
}

struct ContentView: View {
    let API_KEY = ProcessInfo.processInfo.environment["plant_api_key"]
    
    @State var plantsArray: [Plant] = []
    
    func requestPlants(completion: @escaping ((AFResult<[Plant]>) -> Void)) {
        AF.request("https://trefle.io/api/v1/plants?token=\(API_KEY ?? "")&limit=10").responseDecodable {
            (response: AFDataResponse<PlantListResponse>) in
            switch response.result {
            case .success(let response):
                completion(.success(response.plants))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func requestMyApi(completion: @escaping ((AFResult<Any>) -> Void)) {
        AF.request("https://plant-collector-api.herokuapp.com/test").response {
            response in
                debugPrint(response)
        }
    }

    var body: some View {
        VStack {
            if (plantsArray.isEmpty) {
                EmptyView()
            } else {
                PlantList(plants: plantsArray)
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity).background(ColorManager.background).ignoresSafeArea(.all)
        .onAppear {
            let _: () = requestPlants{
                result in
                switch result {
                case .success(let plants):
                    print(plants)
                    self.plantsArray = plants
                case .failure(let error):
                    print(error)
                }
            }
            
            let _: () = requestMyApi{
                result in
                print(result)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
