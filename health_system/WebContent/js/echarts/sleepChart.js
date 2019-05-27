function drewSleepEcharts(id, url, option) {
	var myChart = echarts.init(document.getElementById(id));
	myChart.showLoading();
	var flag = loadSleepData(url, option);
	if (flag) {
		setTimeout(function() {
			myChart.hideLoading();
		}, 1000);
		myChart.setOption(option);
	}
}

function loadSleepData(url, option) {
	var flag = false;
	$.ajax({
		type : "post",
		async : false,
		url : url,
		data : {},
		dataType : "json",
		success : function(result) {
			if (result) {
				flag = true;
				// 1.categoryX轴日期
				option.xAxis.data = [];
				for (var i = result.length - 1; i >= 0; i--) {
					option.xAxis.data.push(result[i].date);
				}
				// 2.series[0]浅睡眠
				option.series[0].data = [];
				for (var i = result.length - 1; i >= 0; i--) {
					option.series[0].data.push(result[i].ssleep);
				}
				// 2.series[1]深睡眠
				option.series[1].data = [];
				for (var i = result.length - 1; i >= 0; i--) {
					option.series[1].data.push(result[i].dsleep);
				}
				// 2.series[2]清醒
				option.series[2].data = [];
				for (var i = result.length - 1; i >= 0; i--) {
					option.series[2].data.push(result[i].awake);
				}
			}
		}
	});
	return flag;
}
