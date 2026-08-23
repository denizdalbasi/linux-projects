# Server Health Monitor (Bash)

> A simple script that checks your server's CPU, RAM, and disk usage, saves the data to a log file, and sends an alert to Discord if the CPU usage gets too high.

---

## What can it do?

* **Tracks resources:** Checks your current CPU, RAM, and disk usage.
* **Saves history:** Writes all data into a daily log file.
* **Discord alerts:** Sends a warning message to your Discord channel if CPU usage goes over **80%**.
* **Cleans old files:** Automatically deletes log files that are older than **7 days**.
