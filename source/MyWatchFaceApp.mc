// This file is the main entry point of the watch face application.
// It initializes the watch face and sets up the necessary components.

class MyWatchFaceApp extends WatchFace {
    function initialize() {
        // Initialize the watch face components
        this.setBackgroundColor(Color.BLACK);
        this.setTimeFormat(TimeFormat.HH_MM);
        this.setDateFormat(DateFormat.DD_MM);
    }

    function onUpdate(dc) {
        // Update the watch face every tick
        dc.clear();
        this.drawTime(dc);
        this.drawDate(dc);
    }

    function drawTime(dc) {
        // Draw the current time on the watch face
        var time = System.getTime();
        dc.drawText(time, this.getWidth() / 2, this.getHeight() / 2, Font.DEFAULT, Color.WHITE);
    }

    function drawDate(dc) {
        // Draw the current date on the watch face
        var date = System.getDate();
        dc.drawText(date, this.getWidth() / 2, this.getHeight() / 2 + 20, Font.DEFAULT, Color.WHITE);
    }
}