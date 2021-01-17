import QtQuick 2.12
import QtMultimedia 5.14
import QtQuick.Window 2.14

Item {
    id: videoPreview

    Camera {
        id: camera
        captureMode: Camera.CaptureStillImage

        imageCapture {
            onImageCaptured: {
                photoPreview.source = preview
            }
        }

        videoRecorder {
            resolution: "640x480"
            frameRate: 30
            audioEncodingMode: CameraRecorder.ConstantBitRateEncoding
            audioBitRate: 128000
            mediaContainer: "mp4"
        }
    }

    Rectangle {
        id: background
        anchors.fill: parent
        color: "#212121"

        VideoOutput {
            id: viewfinder
            visible: true
            anchors.centerIn: parent.Center
            width: parent.width
            height: parent.height
            source: camera
            focus: visible
        }

        MouseArea {
            anchors.fill: parent
            onDoubleClicked: fullScreen()
        }
    }

    Image {
        id: photoPreview
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        visible: false
    }

    function fullScreen() {
        background.parent = (background.parent == videoPreview) ? root : videoPreview
    }

    function record() {
        console.log(camera.videoRecorder.actualLocation)
        camera.videoRecorder.record()
        if (camera.videoRecorder.recorderState === CameraRecorder.StoppedState)
        {
            console.log("Записываю")
            console.log("Save to " + camera.videoRecorder.outputLocation.toString())
        } else {
            console.log("Не записываю")
        }
    }

    function stop() { camera.videoRecorder.stop() }

    function capture() {
        console.log("Save to " + camera.imageCapture.capturedImagePath.toString())
        camera.imageCapture.capture()
    }
}
