import SwiftUI
import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    var captureSession: AVCaptureSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        captureSession = AVCaptureSession()
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            return
        }
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        captureSession.stopRunning()
    }
}

struct PrevCameraView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> CameraViewController {
        return CameraViewController()
    }
    
    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {
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
