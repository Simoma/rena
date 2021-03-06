/*
    Copyright 2014 Simo Mattila
    simo.h.mattila@gmail.com

    This file is part of Rena.

    Rena is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    any later version.

    Rena is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Rena.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    Label {
        id: label
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -parent.height * 2/5
        text: "Rena"
        font.pixelSize: 120
        font.bold: true
        opacity: 0.2

        transform: Rotation {
            origin.x: label.width / 2
            origin.y: label.height / 2
            angle:-10
        }
    }

    Column {
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -parent.height / 12
        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: recorder.tracking ? qsTr("Recording") : qsTr("Stopped")
        }
        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: (recorder.distance/1000).toFixed(2) + " km"
            font.pixelSize: Theme.fontSizeHuge
        }
        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: recorder.time
            font.pixelSize: Theme.fontSizeMedium
        }
    }

    CoverActionList {
        id: coverAction
        CoverAction {
            iconSource: recorder.tracking ? "image://theme/icon-cover-pause" : "image://theme/icon-cover-play"
            onTriggered: recorder.tracking = !recorder.tracking
        }
    }
}


