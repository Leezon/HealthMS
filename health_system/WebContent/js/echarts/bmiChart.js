function drewBMI(){
var myChart = echarts.init(document.getElementById("chart1"));
var ISBMI = parseFloat(document.getElementById("BMI").innerText).toFixed(2);

myChart.showLoading();

// BMI配置项
var bmiOption = {
	tooltip : {
		formatter : "{a} <br/>{c} {b}"
	},
	toolbox : {
		show : true,
		feature : {
			restore : {
				show : true
			},
			saveAsImage : {
				show : true
			}
		}
	},
	series : [
			{
				name : 'BMI',
				type : 'gauge',
				z : 3,
				min : 15,
				max : 30,
				splitNumber : 10,
				radius : '50%',
				axisLine : { // 坐标轴线
					lineStyle : { // 属性lineStyle控制线条样式
						width : 10,
						color : [[0.233,'#CCCC66'], [0.6,'#66CC00'],[0.8667,'#FF9966'],[1,'#CC0033']],
					}
				},
				axisTick : { // 坐标轴小标记
					length : 15, // 属性length控制线长
					lineStyle : { // 属性lineStyle控制线条样式
						color : 'auto'
					}
				},
				splitLine : { // 分隔线
					length : 20, // 属性length控制线长
					lineStyle : { // 属性lineStyle（详见lineStyle）控制线条样式
						color : 'auto'
					}
				},
				axisLabel : {
					backgroundColor : 'auto',
					borderRadius : 2,
					color : '#eee',
					padding : 3,
					textShadowBlur : 2,
					textShadowOffsetX : 1,
					textShadowOffsetY : 1,
					textShadowColor : '#222'
				},
				title : {
					// 其余属性默认使用全局文本样式，详见TEXTSTYLE
					fontWeight : 'bolder',
					fontSize : 20,
				},
				detail : {
					// 其余属性默认使用全局文本样式，详见TEXTSTYLE
					formatter : function(value) {
						value = (value + '').split('.');
						value.length < 2 && (value.push('00'));
						return ('00' + value[0]).slice(-2) + '.'
								+ (value[1] + '00').slice(0, 2);
					},
					 fontWeight: 'bolder',
		                borderRadius: 3,
		                borderColor: '#ff6e64',
		                borderWidth: 2,
		                fontFamily: 'Arial',
		                width: 100,
		                color: '#ff6e64',
					rich : {}
				},
				data : [ {
					value : ISBMI,
					name : '身体质量指数'
				} ]
			}, ]
};

setTimeout(function() {
	myChart.hideLoading();
}, 1000);
if(ISBMI)
myChart.setOption(bmiOption);
}
