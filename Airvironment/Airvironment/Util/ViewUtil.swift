import UIKit

class ViewUtils {

    static func getKeyWindow() -> UIWindow? {
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.makeKeyAndVisible()
        return UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    }
}

