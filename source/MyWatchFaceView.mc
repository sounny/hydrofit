import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Time.Gregorian;
import Toybox.ActivityMonitor;
import Toybox.Application.Properties;

// This file defines the custom view for the watch face, including the drawing logic and how the time and other elements are rendered.

class MyWatchFaceView extends WatchUi.WatchFace {

    private var timeLabel as Text?;
    private var dateLabel as Text?;
    private var hrLabel as Text?;
    private var batteryLabel as Text?;
    private var stepsLabel as Text?; // Added for steps

    // Constructor
    function MyWatchFaceView() {
        // Initialize the watch face view
    }

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFaceLayout(dc));

        timeLabel = findDrawableById("TimeLabel") as Text;
        dateLabel = findDrawableById("DateLabel") as Text;
        hrLabel = findDrawableById("HRLabel") as Text;
        batteryLabel = findDrawableById("BatteryLabel") as Text;
        stepsLabel = findDrawableById("StepsLabel") as Text; // Added for steps
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Method to draw the watch face
    function onDraw(graphics) {
        // Clear the background
        graphics.clear();

        // Draw the time
        var currentTime = System.getTime();
        var timeString = currentTime.format("HH:mm");
        graphics.drawText(timeString, 50, 50, "fontName", "color");

        // Additional drawing logic for date and other elements can be added here
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Get and show the current time
        var clockTime = System.getClockTime();
        var timeString = Lang.format("$1$:$2$", [clockTime.hour.format("%02d"), clockTime.min.format("%02d")]);
        if (timeLabel != null) {
            timeLabel.setText(timeString);
        }

        // Get and show the current date
        var now = Time.now();
        var info = Gregorian.info(now, Time.FORMAT_MEDIUM); // Example: "Mon, Jan 1"
        var dateString = Lang.format("$1$, $2$ $3$", [info.day_of_week, info.month, info.day]);
         if (dateLabel != null) {
            dateLabel.setText(dateString);
        }

        // Get and show Heart Rate
        var hrText = "--";
        var activityInfo = ActivityMonitor.getInfo();
        if (activityInfo != null && activityInfo.currentHeartRate != null) {
            hrText = "HR: " + activityInfo.currentHeartRate.toString();
        } else {
            hrText = "HR: --";
        }
        if (hrLabel != null) {
            hrLabel.setText(hrText);
        }
        
        // Get and show Battery Status
        var stats = System.getSystemStats();
        var batteryString = Lang.format("BAT: $1$%", [stats.battery.format("%d")]);
        if (batteryLabel != null) {
            batteryLabel.setText(batteryString);
        }

        // Get and show Daily Steps
        var stepsText = "STEPS: --";
        // activityInfo should still be valid from HR check
        if (activityInfo != null && activityInfo.steps != null) {
            stepsText = "STEPS: " + activityInfo.steps.toString();
        }
        if (stepsLabel != null) {
            stepsLabel.setText(stepsText);
        }

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

}