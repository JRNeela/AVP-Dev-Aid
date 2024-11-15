import Foundation
import SwiftUI
import Combine

class GazeTracker: ObservableObject {
    @Published var gazePosition: CGPoint = .zero
    private var cancellables = Set<AnyCancellable>()

    init() {
        setupFocusTracking()
    }

    private func setupFocusTracking() {
        // Use SwiftUI's FocusState for gaze tracking
        NotificationCenter.default.publisher(for: Notification.Name("FocusGazePoint"))
            .sink { [weak self] notification in
                guard let self = self,
                      let userInfo = notification.userInfo,
                      let gazePoint = userInfo["gazePoint"] as? CGPoint else {
                    return
                }

                DispatchQueue.main.async {
                    // Update the gaze position
                    self.gazePosition = gazePoint
                }
            }
            .store(in: &cancellables)
    }
}
