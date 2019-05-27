// 请求运动数据URL
var stepUrl = "Step";

// 请求睡眠数据URL
var sleeppUrl = "Sleep";


// 运动配置项
var stepOption = {
	title : {
		text : '运动步数统计'
	},
	tooltip : {
		show : true
	},
	legend : {
		data : [ '步数' ]
	},
	xAxis : [ {
		type : 'category',
	} ],
	yAxis : [ {
		type : 'value'
	} ],
	series : [ {
		"name" : "步数",
		"type" : "bar",
		markLine : {
			lineStyle : {
				color : {
					type : 'linear',
					x : 0,
					y : 0,
					x2 : 0,
					y2 : 1,
					colorStops : [ {
						offset : 0,
						color : '#FF9900' // 0% 处的颜色
					}, {
						offset : 1,
						color : '#FF9900' // 100% 处的颜色
					} ],
					global : false
				// 缺省为 false
				}
			},
			silent : true,
			data : [ {
				yAxis : 8000
			}, {
				yAxis : 12000
			} ]
		}
	} ],
	color : [ "#66CC00", "#9933CC", "#FF6666", "#CCCCCC" ],
};

// 睡眠配置项
var sleepOption = {
	title : {
		text : '睡眠信息统计'
	},
	color : [ "#3399CC", "#003366", "#FF0033" ],
	tooltip : {
		trigger : 'axis',
		axisPointer : { // 坐标轴指示器，坐标轴触发有效
			type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
		}
	},
	legend : {
		data : [ '浅睡时长', '深睡时长', '清醒时长' ]
	},
	grid : {
		left : '3%',
		right : '4%',
		bottom : '3%',
		containLabel : true
	},
	xAxis : {
		type : 'category',

	},
	yAxis : {
		type : 'value',

	},
	series : [ {
		name : '浅睡时长',
		type : 'bar',
		stack : '总量',
		label : {
			normal : {
				show : true,
			}
		},
		markLine : {
			lineStyle : {
				color : {
					type : 'linear',
					x : 0,
					y : 0,
					x2 : 0,
					y2 : 1,
					colorStops : [ {
						offset : 0,
						color : '#CCFF00' // 0% 处的颜色
					}, {
						offset : 1,
						color : '#CCFF00' // 100% 处的颜色
					} ],
					global : false
				// 缺省为 false
				}
			},
			silent : true,
			data : [ {
				yAxis : 360
			} ]
		}

	}, {
		name : '深睡时长',
		type : 'bar',
		stack : '总量',
		label : {
			normal : {
				show : true,
			}
		},
		markLine : {
			lineStyle : {
				color : {
					type : 'linear',
					x : 0,
					y : 0,
					x2 : 0,
					y2 : 1,
					colorStops : [ {
						offset : 0,
						color : '#CC3399' // 0% 处的颜色
					}, {
						offset : 1,
						color : '#CC3399' // 100% 处的颜色
					} ],
					global : false
				// 缺省为 false
				}
			},
			silent : true,
			data : [ {
				yAxis : 480
			} ]
		}

	}, {
		name : '清醒时长',
		type : 'bar',
		stack : '总量',
		label : {
			normal : {
				show : true,
			}
		},

	}, ]
};

// 发送请求，并绘制图形
// drewStepEcharts("box1", stepUrl, stepOption);
// drewSleepEcharts("box2", sleeppUrl, sleepOption);
