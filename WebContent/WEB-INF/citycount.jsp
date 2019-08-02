<%@ page  contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<head>
    <meta charset="utf-8">
    <title>2019年全国二手车在售量市场调研</title>
    <style type="text/css">
    	.page3 {
    		float: right;
    	}
    	.page1{
    		float: right;
    	}
    </style>
</head>
<body>

	<a href="type_bj.do" class="page3">重点城市二手车全部品牌汇总和数量显示</a><br/>
	<a href="car.do" class="page1">返回首页</a>
	
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="height:700px"></div>
    
    <!-- ECharts单文件引入 -->
    <script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
    <script type="text/javascript">
    
    /* 在主文件引入后你将获得一个AMD环境，配置require.conifg如下： */
    require.config({
        paths: {
            echarts: 'http://echarts.baidu.com/build/dist'
        }
    });
    
    /* 通过动态加载使用echarts */
    require(
            [
                'echarts',
                'echarts/chart/map',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
                'echarts/chart/pie'
            ],
            function (ec) {
                var myChart = ec.init(document.getElementById('main'));
                
                var data = <%=request.getAttribute("cityjson")%>
                
                var option = {
                	    title : {
                	        text: '2019年全国二手车在售量市场调研',
                	        subtext: '数据来自某些二手车网站'
                	    },
                	    tooltip : {
                	        trigger: 'item'
                	    },
                	    /* 图例 */
                	    legend: {
                	        x:'right',
                	        y:'bottom',
                	        selectedMode:false,
                	        data:['北京']
                	    },
                	    /* 值域控件 */
                	    dataRange: {
                	        orient: 'horizontal',
                	        min: 0,
                	        max: 55000,
                	        text:['高','低'],           // 文本，默认为数值文本
                	        splitNumber:0
                	    },
                	    /* 工具箱  */
                	    toolbox: {
                	        show : true,
                	        orient: 'vertical',
                	        x:'right',
                	        y:'center',
                	        feature : {
                	            mark : {show: true},
                	            dataView : {show: true, readOnly: false}
                	        }
                	    },
                	    /* 驱动图表生成的数据内容数组 */
                	    series : [
                	        {
                	            name: '2019年全国二手车在售量分布',
                	            type: 'map',
                	            mapType: 'china',
                	            mapLocation: {
                	                x: 'left'
                	            },
                	            selectedMode : 'multiple',
                	            itemStyle:{
                	                normal:{label:{show:true}},
                	                emphasis:{label:{show:true}}
                	            },
                	            data:data
                	        },
                	        {
                	            name:'2019年全国二手车在售量对比',
                	            type:'pie',
                	            roseType : 'area',
                	            tooltip: {
                	                trigger: 'item',
                	                formatter: "{a} <br/>{b} : {c} ({d}%)"
                	            },
                	            center: [document.getElementById('main').offsetWidth - 450, 350],
                	            radius: [60, 180],
                	            data:[
                	                {name: '北京', value: 3404},
                	            ]
                	        }
                	    ],
                	    animation: false
                	};
                	var ecConfig = require('echarts/config');
                	myChart.on(ecConfig.EVENT.MAP_SELECTED, function (param){
                	    var selected = param.selected;
                	    var mapSeries = option.series[0];
                	    var data = [];
                	    var legendData = [];
                	    var name;
                	    for (var p = 0, len = mapSeries.data.length; p < len; p++) {
                	        name = mapSeries.data[p].name;
                	        //mapSeries.data[p].selected = selected[name];
                	        if (selected[name]) {
                	            data.push({
                	                name: name,
                	                value: mapSeries.data[p].value
                	            });
                	            legendData.push(name);
                	        }
                	    }
                	    option.legend.data = legendData;
                	    option.series[1].data = data;
                	    myChart.setOption(option, true);
                	})
                	                    
                myChart.setOption(option);
            }
        );
    </script>
    
</body>