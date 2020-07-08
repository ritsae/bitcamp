$(function(){
    /* projectAllChart */
	projectStatusChartAjax();
	
	$('#status-btn').on('click', function(){
		projectStatusChartAjax();
    })
    
    $('#type-btn').on('click', function(){
    	projectTypeChartAjax();
    })

    /* issueALlChart */
    $.ajax({
        url : '/dashBoard/chart/issueAll',
        type : 'GET',
        dataType : 'json'
    }).done(function(status){
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(function(){
            drawIssueAllChart(status);
        });
    }).fail(function(){
        alert('chart fail!!')
    })

    /* monthlyBarChart */
    $.ajax({
        url : '/dashBoard/chart/monthlyProject',
        type : 'GET',
        dataType : 'json'
    }).done(function(list){
        google.charts.load('current', {'packages':['corechart','bar']});
        google.charts.setOnLoadCallback(function(){
            drawMonthlyProjectChart(list);
        });
    }).fail(function(){
        alert('chart stack fail!!')
    })
})

function projectTypeChartAjax(){
	$.ajax({
		url : 'dashBoard/chart/projectAllByType',
		type : 'GET',
		dataType : 'json'
	}).done(function(list){
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(function(){
			drawProjectAllTypeChart(list);
		});
	}).fail(function(){
		alert('project chart by type fail')
	})
}

function projectStatusChartAjax(){
	$.ajax({
		url : '/dashBoard/chart/projectAll',
		type : 'GET',
		dataType : 'json'
	}).done(function(status){
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(function(){
			drawProjectAllChart(status);
		});
	}).fail(function(){
		alert('chart fail!!')
	})
}

function drawProjectAllTypeChart(status){
    var lists = [];
    var allAccount = 0;
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'name');
    data.addColumn('number', 'count');
    status.forEach(function(element){
    	allAccount += element.projectTypeAccount;
        lists.push([element.projectTypeName,element.projectTypeAccount]);
    });
    data.addRows(lists);

    var options = {
        chartArea: {width:'100%',height:'80%'},
        pieHole: 0.4,
        colors: ['#4FC1E9','#5D9CEC','#48CFAD','#A0D468','#FFCE54','#FC6E51'],
        pieSliceText: 'label',
        legend: 'none'
    };

    if (data.getNumberOfRows() == 0) {
        data.addRows([
            ['없음', 1]
        ]);
        options.pieSliceTextStyle = {
            color: 'black'
        };
        options.tooltip = {
            trigger: 'none'
        }
    }

    var chart = new google.visualization.PieChart(document.getElementById('ProjectAllStatusChart'));
    chart.draw(data, options);
    $('#all-account').html('총  ' + allAccount + '건');
}

function drawProjectAllChart(status){
    var lists = [];
    var allAccount = 0;
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'name');
    data.addColumn('number', 'count');
    status.forEach(function(element){
    	allAccount += element.projectStatus;
        lists.push([element.projectStatusName,element.projectStatus]);
    });
    data.addRows(lists);

    var options = {
        chartArea: {width:'100%',height:'80%'},
        pieHole: 0.4,
        colors: ['#4FC1E9','#5D9CEC','#48CFAD','#A0D468','#FFCE54','#FC6E51'],
        pieSliceText: 'label',
        legend: 'none'
    };

    if (data.getNumberOfRows() == 0) {
        data.addRows([
            ['없음', 1]
        ]);
        options.pieSliceTextStyle = {
            color: 'black'
        };
        options.tooltip = {
            trigger: 'none'
        }
    }

    var chart = new google.visualization.PieChart(document.getElementById('ProjectAllStatusChart'));
    chart.draw(data, options);
    $('#all-account').html('총  ' + allAccount + '건');
}

function drawIssueAllChart(status){
    var lists = new Array();
    var allAccount = 0;
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'name');
    data.addColumn('number', 'count');
    status.forEach(function(element){
    	allAccount += element.issueStatus;
        lists.push([element.issueStatusName,element.issueStatus]);
    });
    data.addRows(lists);


    var options = {
        chartArea: {width:'100%',height:'80%'},
        pieHole: 0.4,
        colors: ['#4FC1E9','#5D9CEC','#48CFAD','#A0D468','#FFCE54','#FC6E51'],
        pieSliceText: 'label',
        legend: 'none'
    };

    if (data.getNumberOfRows() == 0) {
        data.addRows([
            ['없음', 1]
        ]);
        options.pieSliceTextStyle = {
            color: 'black'
        };
        options.tooltip = {
            trigger: 'none'
        }
    }

    var chart = new google.visualization.PieChart(document.getElementById('IssueAllStatusChart'));
    chart.draw(data, options);
    $('#issue-all-account').html('총  ' + allAccount + '건')
}

function drawMonthlyProjectChart(list){
    var lists = new Array();
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'month');
    data.addColumn('number', '연구');
    data.addColumn('number', '개발');
    data.addColumn('number', '디자인');
    data.addColumn('number', '품질');
    data.addColumn('number', '유지보수');
    // lists.push('dd',1);
    list.forEach(function(element){
        lists.push([element.projectMonth + ' (' + element.projectCount + ') ', element.devType100, element.devType200, element.devType300, element.devType400, element.devType500]);
    });
    data.addRows(lists);

    var options = {
        chartArea: {width:'100%',height:'80%'},
        colors: ['#4FC1E9','#5D9CEC','#48CFAD','#A0D468','#FFCE54','#FC6E51'],
        legend: 'none',
        isStacked: true
    };

    if (data.getNumberOfRows() == 0) {
        data.addRows([
            ['없음', 1]
        ]);
        options.tooltip = {
            trigger: 'none'
        }
    }

    var chart = new google.visualization.ColumnChart(document.getElementById('MonthlyProjectChart'));
    chart.draw(data, options);
}