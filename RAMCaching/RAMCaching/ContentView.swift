//
//  ContentView.swift
//  RAMCaching
//
//  Created by Leo Nugraha on 2022/6/25.
//

import SwiftUI

class CacheManager {
    
    public static let instance = CacheManager()
    
    private init() {}
    
    public var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1_024 * 1_024 * 100 // 100MB
        return cache
    }()
    
    public func add(image: UIImage, name: String) {
        imageCache.setObject(image, forKey: name as NSString)
        print("\(#line) - Added to RAM cache")
    }
    
    public func remove(name: String) {
        imageCache.removeObject(forKey: name as NSString)
        print("\(#line) - Removed from RAM cache")
    }
    
    public func get(name: String) -> UIImage? {
        return imageCache.object(forKey: name as NSString)
    }
    
}

class CacheViewModel: ObservableObject {
    
    @Published var startingImage: UIImage? = nil
    @Published var cachedImage: UIImage? = nil
    let imageName: String = "cached-item"
    let manager = CacheManager.instance

    public init() {
        self.getImageFromAssetFolder()
    }
    
    public func getImageFromAssetFolder() {
        self.startingImage = UIImage(named: self.imageName)
    }
    
    public func savedToCache() {
        guard let image = self.startingImage else {
            return
        }
        
        manager.add(image: image, name: self.imageName)

    }

    public func removeFromCache() {
        manager.remove(name: self.imageName)
    }

    public func getFromCache() {
        // if let returnedImage = manager.get(name: self.imageName) {
        //     self.cachedImage = returnedImage
        // }
        self.cachedImage = manager.get(name: self.imageName)
    }
    
}

struct ContentView: View {
    
    @StateObject var vm = CacheViewModel()
    
    var body: some View {
        NavigationView {
            
            VStack {

                if let image = vm.startingImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .frame(width: 300, height: 300, alignment: .center)
                        .clipped()
                }

                HStack {
                    Button(action: {
                        vm.savedToCache()
                    }) {
                        Text("Save to cache")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(.blue)
                            .cornerRadius(10)
                    }

                    Button(action: {
                        vm.removeFromCache()
                    }) {
                        Text("Remove from cache")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(.red)
                            .cornerRadius(10)
                    }

                    Button(action: {
                        vm.getFromCache()
                    }) {
                        Text("Get from cache")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(.green)
                            .cornerRadius(10)
                    }
                    
                }
            
                if let image = vm.cachedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .frame(width: 300, height: 300, alignment: .center)
                        .clipped()
                }
                
                Spacer()
            }
        }
        .navigationTitle("Memory Caching Efficiency")
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
