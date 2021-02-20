import QtQuick 2.12
import QtMultimedia 5.14
import QtQuick.Window 2.14

Item {
    id: videoPreview

    property var fixed: false

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
        deviceId: fixed ? globals.cameraIdFixed : globals.cameraId
    }

    Rectangle {
        id: background
        anchors.fill: parent
        color: "#212121"
        radius: 10

        VideoOutput {
            id: viewfinder
            visible: true
            anchors.centerIn: parent.Center
            anchors {
                top: parent.top
                topMargin: 5
                left: parent.left
                leftMargin: anchors.topMargin
                right: parent.right
                rightMargin: anchors.topMargin
                bottom: parent.bottom
                bottomMargin: anchors.topMargin
            }
            source: camera
            focus: visible
        }

        MouseArea {
            anchors.fill: viewfinder
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
