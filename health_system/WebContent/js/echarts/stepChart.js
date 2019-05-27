function drewStepEcharts(id, url, option) {
	var myChart = echarts.init(document.getElementById(id));
	myChart.showLoading();
	var flag = loadStepData(url, option);
	if (flag) {
		setTimeout(function() {
			myChart.hideLoading();
		}, 1000);
		myChart.setOption(option);
	}
}

function loadStepData(url, option) {
	var flag = false;
	$.ajax({
		type : "post",
		async : false,
		url : url,
		data : {},
		dataType : "json",
		success : function success(result) {
			if (result) {
				flag = true;
				option.xAxis[0].data = [];
				for (var i = result.length - 1; i >= 0; i--) {
					option.xAxis[0].data.push(result[i].date);
				}
				option.series[0].data = [];
				for (var i = result.length - 1; i >= 0; i--) {
					option.series[0].data.push(result[i].step);
				}
			}
		}
	});
	return flag;
}