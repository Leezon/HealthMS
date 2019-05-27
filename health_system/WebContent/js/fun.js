
function dispTime() {
    //1.获取元素
    var time = document.getElementById("time");
    var date, year, month, day, h, m, s, dateTime, str = null;
    var timer = null;

    function f() {
        date = new Date();
        year = date.getFullYear();
        month = date.getMonth() + 1;
        day = date.getDate();
        h = date.getHours();
        m = date.getMinutes();
        s = date.getSeconds();
        dateTime = year + "-" + month + "-" + day + " " + h + ":" + m + ":" + s;
        if (h < 6) {
            str = '熬夜不好，请注意身体哟';
        } else if (h < 9) {
            str = '早上好';
        } else if (h < 12) {
            str = '上午好';
        } else if (h < 19) {
            str = '下午好';
        } else if (h < 24) {
            str = '晚上好';
        }
        //3.插入时间问候语
        time.innerHTML = str+"，当前时间："+"<br/><br/>" + dateTime;
    }

    f();
    //清除定时器
    clearInterval(timer);
    //2.开启定时器
    timer = setInterval(f, 1000);
}
