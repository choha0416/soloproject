/**
 * 
 */
 function updateTime() {
            var now = new Date();
            var hour = now.getHours();
            var minute = now.getMinutes();
            var second = now.getSeconds();
            var am_pm = hour < 12 ? "AM" : "PM";

            if (hour > 12) {
                hour = hour - 12;
            }


            hour = (hour < 10 ? "0" : "") + hour;
            minute = (minute < 10 ? "0" : "") + minute;
            second = (second < 10 ? "0" : "") + second;


            var currentTime = hour + ":" + minute + ":" + second + " " + am_pm;

   
            document.getElementById("current-time").textContent = "현재 접속 시각: " + currentTime;
        }


        window.onload = function() {
            updateTime(); 
            setInterval(updateTime, 1000);  
        }