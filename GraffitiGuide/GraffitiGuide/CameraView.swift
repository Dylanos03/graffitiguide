import SwiftUI
import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    var captureSession: AVCaptureSession! // Variable to hold the capture session
    
    override func viewDidLoad() { // Function to run when the view loads
        super.viewDidLoad() // Call the super class's viewDidLoad function
        
        captureSession = AVCaptureSession() // Create a new capture session
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return } // Get the default video capture device
        let videoInput: AVCaptureDeviceInput // Create a new video input
        
        do { // Try to create a new video input
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice) // Create a new video input
        } catch { // catch errors if any
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput) // Add the video input to the capture session
        } else {
            return
        }
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession) // Create a new preview layer
        previewLayer.frame = view.layer.bounds // Set the frame of the preview layer to the bounds of the view
        previewLayer.videoGravity = .resizeAspectFill // Set the video gravity of the preview layer
        view.layer.addSublayer(previewLayer) // Add the preview layer to the view
        
        captureSession.startRunning() // Start the capture session
    }
    
    override func viewDidDisappear(_ animated: Bool) { // Function to run when the view disappears
        super.viewDidDisappear(animated) // Call the super class's viewDidDisappear function
        captureSession.stopRunning() // Stop the capture session
    }
}

struct PrevCameraView: UIViewControllerRepresentable { // Struct to represent the camera view
    func makeUIViewController(context: Context) -> CameraViewController { // Function to create the camera view
        return CameraViewController() // Return a new camera view controller
    }
    
    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) { // this is needed for the camera view to work
        // No update needed
    }
}

struct CameraView: View {
    var body: some View {
        ZStack {
            PrevCameraView()
            Text("Scan Code!")
            RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/)
                .frame(width: 200, height: 200)
                .opacity(0.5)

            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
