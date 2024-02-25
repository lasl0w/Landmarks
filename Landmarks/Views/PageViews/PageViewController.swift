//
//  PageViewController.swift
//  Landmarks
//
//  Created by tom montgomery on 2/19/24.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable  {
    
    var pages: [Page]
    
    func makeCoordinator() -> Coordinator {
        // instantiate the thing.  return is implied
        Coordinator(self)
        // gets called before makeUIView so you have access to the controller before
        // use the Coordinator to implement common Cocoa patterns:  delegates, data sources and responding to user events via target-action
    }
    
    // needed to conform to the protocol.  need to conform to PageView, not just UIView
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
            )
        pageViewController.dataSource = context.coordinator
        
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            //[UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
            [context.coordinator.controllers[0]], direction: .forward, animated: true)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource {
        var parent: PageViewController
        
        // TODO: why do we call it, instead of just declaring the type
        // Coordinator is a good place to store controllers b/c the system inits them only once.  efficient
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            // trailing closure syntax for map.  pretty cool.
            controllers = parent.pages.map { UIHostingController(rootView: $0)}
        }
        // these two methods establish the relationship between view controllers, so you can swipe back and forth
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                // if we don't have any controllers, bail out
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            // index is something greater than zero
            return controllers[index - 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
    }
    
}

//#Preview {
//    PageViewController()
//}
